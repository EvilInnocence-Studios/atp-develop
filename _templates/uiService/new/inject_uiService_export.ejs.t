---
inject: true
to: ../admin/src/<%= module %>/lib/services.ts
before: '\}\);'
---
    ...<%= h.changeCase.camel(entity) %>Services(methods),
