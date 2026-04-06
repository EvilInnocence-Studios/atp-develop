---
to: ../api/src/<%= module %>-shared/<%= entity %>/types.ts
---
export interface I<%= h.capitalize(module) %><%= h.capitalize(entity) %> {
    id: string;
    createdAt: Date;
    updatedAt: Date;
    // Add additional fields here
}

export interface New<%= h.capitalize(module) %><%= h.capitalize(entity) %> {
    // Add create fields here
}
