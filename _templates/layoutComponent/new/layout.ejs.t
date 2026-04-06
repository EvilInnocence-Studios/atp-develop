---
to: "<%= hasLayoutEditor ? `../${project}/src/${module}/components/${componentName}/${componentName}.layout.tsx` : `` %>"
---
import { <%= componentName %>Component } from "./<%= componentName %>.component";
import { connect<%= componentName %> } from "./<%= componentName %>.container";
import { ILayoutEditorProps, LayoutEditor } from "@theming/lib/layout/componentRegistry";

export const <%= componentName %>LayoutEditor:LayoutEditor = ({css, className, ...props}:ILayoutEditorProps) => {
    const <%= componentName %>Orig = connect<%= componentName %>(<%= componentName %>Component);

    return <>
        {css && <style>{css}</style>}
        <div className={className}>
             <<%= componentName %>Orig {...props} />
        </div>
    </>;
};
