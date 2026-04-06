---
inject: true
to: ../public/package.custom.json
before: '^}'
---
    ,"<%= name %>": {
        "repo": "atp-<%= name %>-ui",
        "branch": "main"
    },
    "<%= name %>-shared": {
        "repo": "atp-<%= name %>-shared",
        "branch": "main"
    }
