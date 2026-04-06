---
to: ../api/src/<%= module %>/<%= entity %>/handlers.ts
---
import { CheckPermissions } from "../../uac/permission/util";
import { pipeTo } from "ts-functional";
import { <%= h.capitalize(entity) %> } from "./services";
import { getBody, getParam, getUserPermissions } from "../../core/express/extractors";
import { HandlerArgs } from "../../core/express/types";
import { Query } from "../../core-shared/express/types";
import { I<%= h.capitalize(module) %><%= h.capitalize(entity) %>, New<%= h.capitalize(module) %><%= h.capitalize(entity) %> } from "src/<%= module %>-shared/<%= entity %>/types";

class <%= h.capitalize(entity) %>HandlerClass {
    @CheckPermissions("<%= module %><%= h.capitalize(entity) %>.create")
    public create(...args: HandlerArgs<New<%= h.capitalize(module) %><%= h.capitalize(entity) %>>): Promise<I<%= h.capitalize(module) %><%= h.capitalize(entity) %>> {
        return pipeTo(<%= h.capitalize(entity) %>.create, getBody<New<%= h.capitalize(module) %><%= h.capitalize(entity) %>>)(args);
    }

    @CheckPermissions("<%= module %><%= h.capitalize(entity) %>.view")
    public search(...args: HandlerArgs<Query>): Promise<I<%= h.capitalize(module) %><%= h.capitalize(entity) %>[]> {
        return pipeTo(<%= h.capitalize(entity) %>.search, getBody<Query>)(args);
    }

    @CheckPermissions("<%= module %><%= h.capitalize(entity) %>.view")
    public get(...args: HandlerArgs<undefined>): Promise<I<%= h.capitalize(module) %><%= h.capitalize(entity) %>> {
        return pipeTo(<%= h.capitalize(entity) %>.loadById, getParam("<%= entity %>Id"))(args);
    }

    @CheckPermissions("<%= module %><%= h.capitalize(entity) %>.update")
    public update(...args: HandlerArgs<Partial<I<%= h.capitalize(module) %><%= h.capitalize(entity) %>>>): Promise<I<%= h.capitalize(module) %><%= h.capitalize(entity) %>> {
        return pipeTo(<%= h.capitalize(entity) %>.update, getParam("<%= entity %>Id"), getBody<Partial<I<%= h.capitalize(module) %><%= h.capitalize(entity) %>>>)(args);
    }

    @CheckPermissions("<%= module %><%= h.capitalize(entity) %>.delete")
    public remove(...args: HandlerArgs<undefined>): Promise<null> {
        return pipeTo(<%= h.capitalize(entity) %>.remove, getParam("<%= entity %>Id"))(args);
    }
}

export const <%= h.capitalize(entity) %>Handlers = new <%= h.capitalize(entity) %>HandlerClass();
