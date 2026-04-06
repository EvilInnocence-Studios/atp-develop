---
to: ../api/src/<%= module %>/<%= entity %>/endpoints.ts
---
import { del, get, patch, post } from "../../core/express/wrappers";
import { <%= h.capitalize(entity) %>Handlers } from "./handlers";

export const <%= h.capitalize(entity) %>Endpoints = {
    <%= entity %>: {
        GET: get(<%= h.capitalize(entity) %>Handlers.search),
        POST: post(<%= h.capitalize(entity) %>Handlers.create),
        ":<%= entity %>Id": {
            GET: get(<%= h.capitalize(entity) %>Handlers.get),
            PATCH: patch(<%= h.capitalize(entity) %>Handlers.update),
            DELETE: del(<%= h.capitalize(entity) %>Handlers.remove),
        }
    }
};
