---
inject: true
to: ../api/package.custom.json
before: '^}'
---
    ,"<%= name %>": {
        "repo": "atp-<%= name %>-api",
        "branch": "main"
    },
    "<%= name %>-shared": {
        "repo": "atp-<%= name %>-shared",
        "branch": "main"
    }
