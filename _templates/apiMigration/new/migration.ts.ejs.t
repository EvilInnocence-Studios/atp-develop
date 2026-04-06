---
to: ../api/src/<%= module %>/migrations/<%= sequence %>-<%= h.changeCase.camel(migrationName) %>.ts
---
import { database } from "../../core/database";
import { IMigration } from "../../core/dbMigrations";
<% if(typeof entity !== 'undefined' && entity) { -%>
import { insertPermissions, insertRolePermissions } from "../../uac/migrations/util";
import { <%= h.changeCase.camel(entity) %>sTable } from "./tables";
<% } -%>

const db = database();

<% if(typeof entity !== 'undefined' && entity) { -%>
const permissions = [
    { name: "<%= module %><%= h.capitalize(entity) %>.create", description: "Can create <%= module %> <%= entity %>" },
    { name: "<%= module %><%= h.capitalize(entity) %>.view", description: "Can view <%= module %> <%= entity %>" },
    { name: "<%= module %><%= h.capitalize(entity) %>.update", description: "Can edit <%= module %> <%= entity %>" },
    { name: "<%= module %><%= h.capitalize(entity) %>.delete", description: "Can delete <%= module %> <%= entity %>" },
];

const rolePermissions = [
    ...permissions.map(p => ({ roleName: "SuperUser", permissionName: p.name })),
    ...permissions.filter(p => p.name.endsWith(".view")).map(p => ({ roleName: "Public", permissionName: p.name })),
];
<% } -%>

export const migration: IMigration = {
    name: "<%= module %>-<%= sequence %>-<%= h.changeCase.camel(migrationName) %>",
    module: "<%= module %>",
    description: "<%= migrationName %>",
    version: "1.0.0",
    order: 3,
    up: async () => {
<% if(typeof entity !== 'undefined' && entity) { -%>
        await db.schema.createTable("<%= module %><%= h.capitalize(entity) %>s", <%= h.changeCase.camel(entity) %>sTable);
<% } else { -%>
        // Run migration code here
<% } -%>
    },
    down: async () => {
<% if(typeof entity !== 'undefined' && entity) { -%>
        await db.schema.dropTableIfExists("<%= module %><%= h.capitalize(entity) %>s");
<% } else { -%>
        // Run rollback code here
<% } -%>
    },
    initData: async () => {
        // Setup initial default data
<% if(typeof entity !== 'undefined' && entity) { -%>
        await insertPermissions(db, permissions);
        await insertRolePermissions(db, rolePermissions);
<% } -%>
    }
};
