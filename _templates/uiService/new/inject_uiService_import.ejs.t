---
inject: true
to: ../admin/src/<%= module %>/lib/services.ts
before: 'export const <%= module %>Services'
---
import { <%= h.changeCase.camel(entity) %>Services } from "./<%= entity %>/services";
