---
to: ../admin/src/<%= module %>/lib/<%= entity %>/services.ts
---
import { IMethods } from "@core/lib/types";
import { I<%= h.capitalize(module) %><%= h.capitalize(entity) %>, New<%= h.capitalize(module) %><%= h.capitalize(entity) %> } from "@<%= module %>-shared/<%= entity %>/types";
import { Query } from "@core-shared/express/types";

export const <%= h.changeCase.camel(entity) %>Services = ({get, post, patch, remove}: IMethods) => ({
    <%= h.changeCase.camel(entity) %>: {
        create: (data: New<%= h.capitalize(module) %><%= h.capitalize(entity) %>): Promise<I<%= h.capitalize(module) %><%= h.capitalize(entity) %>> => post("<%= module %>/<%= entity %>", data),
        search: (query: Query): Promise<I<%= h.capitalize(module) %><%= h.capitalize(entity) %>[]> => get("<%= module %>/<%= entity %>", query),
        get: (id: string): Promise<I<%= h.capitalize(module) %><%= h.capitalize(entity) %>> => get(`<%= module %>/<%= entity %>/${id}`),
        update: (id: string, updates: Partial<I<%= h.capitalize(module) %><%= h.capitalize(entity) %>>): Promise<I<%= h.capitalize(module) %><%= h.capitalize(entity) %>> => patch(`<%= module %>/<%= entity %>/${id}`, updates),
        remove: (id: string): Promise<null> => methods.remove(`<%= module %>/<%= entity %>/${id}`)
    }
});
