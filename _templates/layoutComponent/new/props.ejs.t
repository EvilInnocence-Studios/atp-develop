---
to: "<%= hasPropEditor ? `../${project}/src/${module}/components/${componentName}/${componentName}.props.tsx` : `` %>"
---
import { I<%= componentName %>InputProps } from "./<%= componentName %>.d";

export const <%= componentName %>PropEditor = (
    {}: I<%= componentName %>InputProps,
    updateProps: (props: any) => void,
    updateProp: (prop: string) => (value: any) => void
) => {
    return <>
        Placeholder Prop Editor for <%= componentName %>
    </>;
}
