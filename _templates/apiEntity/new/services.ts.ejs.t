---
to: ../api/src/<%= module %>/<%= entity %>/services.ts
---
import { I<%= h.capitalize(module) %><%= h.capitalize(entity) %>, New<%= h.capitalize(module) %><%= h.capitalize(entity) %> } from "src/<%= module %>-shared/<%= entity %>/types";
import { basicCrudService } from "../../core/express/service/common";

const <%= h.capitalize(entity) %>Basic = basicCrudService<I<%= h.capitalize(module) %><%= h.capitalize(entity) %>>("<%= h.changeCase.camel(module) %><%= h.capitalize(entity) %>s");

export const <%= h.capitalize(entity) %> = {
    ...<%= h.capitalize(entity) %>Basic,
};
