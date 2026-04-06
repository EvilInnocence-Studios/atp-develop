---
to: ../admin/src/<%= name %>/index.tsx
---
import { IModule } from "@core/lib/module";
import { menus } from "./lib/menus";
import { routes } from "./lib/routes";
import { settings } from "./lib/settings";

export const module: IModule = {
    name: "<%= name %>",
    menus,
    routes,
    settings,
};
