---
to: ../admin/src/<%= name %>/lib/settings.ts
---
import { Index } from "ts-functional/dist/types";
import { ISettingsConfig } from "@core/lib/settings";

export const settings: Index<ISettingsConfig> = {};
