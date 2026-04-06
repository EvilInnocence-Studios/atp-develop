---
inject: true
to: ../api/src/<%= module %>/endpoints.ts
after: 'export const apiConfig.*{'
---
    ...<%= h.capitalize(entity) %>Endpoints,
