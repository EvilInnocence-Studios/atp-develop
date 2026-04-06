---
to: ../admin/src/<%= name %>/lib/menus.tsx
---
import { ItemType, MenuItemType } from "antd/es/menu/interface";
import { Index } from "ts-functional/dist/types";

export const menus: Index<ItemType<MenuItemType>[]> = {
    admin: [{
        key: "<%= name %>",
        label: "<%= h.capitalize(name) %>",
        children: []
    }],
    public: [],
};
