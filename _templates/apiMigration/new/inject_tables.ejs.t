---
inject: true
to: "<%= typeof entity !== 'undefined' && entity ? `../api/src/${module}/migrations/tables.ts` : null %>"
append: true
---

export const <%= h.changeCase.camel(entity) %>sTable = (t:Knex.CreateTableBuilder) => {
    t.bigIncrements();
    // Add table fields here
}
