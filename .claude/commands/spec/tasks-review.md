---
name: Spec:Tasks-Review
description: Review tasks.md file.
---

# Tasks review

## Command Checklist

- [ ] Ensure `temp-spec/tasks.md` is loaded to context, if not exists then STOP and suggest running `/spec:tasks` first
- [ ] Ensure **ALL** methods/endpoints/hooks etc mentioned in `tasks.md` actually exist in the codebase
- [ ] Ensure **ALL** tasks meet existing project conventions for naming, structure, imports - update tasks accordingly
- [ ] Review every task for new Component or Service to detect and reuse common patterns across files, if found - update tasks accordingly
- [ ] Think for new Components and Services tasks to detect similar existing components, if found - update tasks accordingly to extend/reuse them
- [ ] Analyze for identify shared utilities and helpers, if found - update tasks accordingly
- [ ] Ensure **ALL** tasks following the `Tasks Creation Guidelines`

## Review Patterns (Good Practices)

### 1. Verify All Referenced Components Exist

**Pattern**:
Before approving tasks, verify that all mentioned interfaces, classes, methods, and files actually exist in the codebase.
When tasks reference DTOs or request objects, verify that the properties mentioned actually exist.

**Example Checks**:

- Interface methods exist with correct signatures
- Class implementations match interfaces
- File paths are accurate
- Enums are in correct locations
- DTOs match internal request/response patterns

### 2. Match Frontend and Backend DTO Patterns

**Pattern**: Frontend API methods should mirror backend endpoint structure.

**Example**:

Backend:

```csharp
// Route: POST /api/workflows/steps/{stepId}/execute-task
// Body: { sessionId }
```

Frontend:

```typescript
async executeStepTask(stepId: number, sessionId: number): Promise<Response> {
  return fetchPost('/api/workflows/steps/' + stepId + '/execute-task', { sessionId });
}
```

---

@../../guidelines/TASKS-CREATION.md
