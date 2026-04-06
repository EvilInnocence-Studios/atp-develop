---
to: ../api/src/<%= name %>/migrations/00-init.ts
---
import { database } from "../../core/database";
import { IMigration } from "../../core/dbMigrations";

const db = database();

export const init: IMigration = {
    name: "<%= name %>-00-init",
    module: "<%= name %>",
    description: "Initial data for <%= name %> module",
    version: "1.0.0",
    order: 3,
    up: async () => {},
    down: async () => {},
    initData: async () => {}
};
