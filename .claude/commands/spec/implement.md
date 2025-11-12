---
name: Spec:Implement
description: Execute the implementation plan by processing and executing all tasks defined in tasks.md.
---

# Implementation execution

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Command Checklist

- [ ] Search (`*/guidelines/*.md`) and load all general (server and client) or relevant guidelines markdown files to context, including `.claude/guidelines/GENERAL.md`.
- [ ] Load guidelines skills to context, specifically `dotnet-guidelines` and `react-guidelines`, if relevant to the tasks.
- [ ] Ensure `temp-spec/tasks.md` is loaded to context. If missing or incomplete STOP and suggest running `/spec:tasks` first
- [ ] Implement all tasks from `temp-spec/tasks.md`, following the `Progress Tracking and Reporting Guidelines` below
- [ ] Ensure ALL tasks completed and marked `[X]`

## Progress Tracking and Reporting Guidelines

- Implement tasks sequentially as listed in `temp-spec/tasks.md`, skipping any already marked as `[X]`
- After completing each task, update `temp-spec/tasks.md` to mark it as completed `[X]`
- You are **NOT ALLOWED TO CHANGE ANYTHING** in `temp-spec/tasks.md` except marking tasks as completed
- Do NOT report any progress, like: "Let me ..", "Now I will ...", etc.
- Do NOT report after each task completion
- Only report errors with context and next steps if blocked
- Report final status with summary of all completed work
- Unit tests must implement the AAA pattern (Arrange, Act, Assert). Comment // Arrange, // Act, // Assert in the test methods
