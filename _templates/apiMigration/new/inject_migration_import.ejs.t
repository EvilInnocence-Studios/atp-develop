---
inject: true
to: ../api/src/<%= module %>/index.ts
before: 'export const migrations \='
---
import { migration as <%= h.changeCase.camel(migrationName) %> } from "./migrations/<%= sequence %>-<%= h.changeCase.camel(migrationName) %>";
