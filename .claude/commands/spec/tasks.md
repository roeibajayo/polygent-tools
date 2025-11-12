---
name: Spec:Tasks
description: Generate an actionable tasks.md for the feature based on available design artifacts.
---

# Tasks generation

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Tasks Generation Guidelines

Your objective is to generate a comprehensive `tasks.md` file that outlines all necessary implementation steps.
Use **MUST** use `.claude/templates/tasks.md` as structure, following the `Tasks Creation Guidelines`.
**DO NOT DEVIATE FROM THE TEMPLATE STRUCTURE**.
**DO NOT** generate any docs (.md files) file other than `tasks.md`.

## Command Checklist

- [ ] Search and load all general (server and client) guidelines markdown files to context, including `.claude/guidelines/GENERAL.md`.
- [ ] Load guidelines skills to context, specifically `dotnet-guidelines` and `react-guidelines`, if relevant to the tasks.
- [ ] Ensure `temp-spec/explain.md` is loaded to context, if exists.
- [ ] Ensure `temp-spec/tech-explain.md` is loaded to context, if exists.
- [ ] Generate `temp-spec/tasks.md` following the `Tasks Creation Guidelines`.

@../../guidelines/TASKS-CREATION.md
