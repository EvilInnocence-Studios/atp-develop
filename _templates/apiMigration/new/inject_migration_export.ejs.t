---
inject: true
to: ../api/src/<%= module %>/index.ts
before: '\];'
---
    <%= h.changeCase.camel(migrationName) %>,
