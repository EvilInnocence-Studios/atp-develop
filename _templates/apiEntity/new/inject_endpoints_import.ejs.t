---
inject: true
to: ../api/src/<%= module %>/endpoints.ts
before: 'export const apiConfig'
---
import { <%= h.capitalize(entity) %>Endpoints } from "./<%= entity %>/endpoints";
