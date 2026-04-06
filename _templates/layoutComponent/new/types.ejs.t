---
to: ../<%= project %>/src/<%= module %>/components/<%= componentName %>/<%= componentName %>.d.ts
---
import { ILayoutComponent } from "@theming/lib/layout/componentRegistry";

export declare interface I<%= componentName %>Props {

}

// What gets passed into the component from the parent as attributes
export declare interface I<%= componentName %>InputProps {
    className?: string;
    css?: string;
    classes?: any;
    slots?: Index<ILayoutComponent[]>;
    __layoutId?: string;
}

export type <%= componentName %>Props = I<%= componentName %>InputProps & I<%= componentName %>Props;
