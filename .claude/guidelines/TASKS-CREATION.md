# Tasks Creation Guidelines

**CRITICAL**: Tasks MUST be organized by Project to enable independent implementation.

### Task Organization

- Each project (P1, P2, P3...) gets its own phase
- Each project section should contains only backend or frontend tasks as applicable, not mixed
- Within each project, group tasks by component type AS IN THE TEMPLATE

## Output file guidelines

- Task must be specific enough that an LLM can complete it without additional context
- Task NEVER includes Code snippets or line numbers
- Every task MUST meet existing project conventions for naming, structure, imports
- Each task should be a single, atomic action
- Project-specific phases (P1, P2, P3...): no mixing projects and no separated phases for single project
- Each project includes implementation tasks only
- Use checkboxes for trackability
- Indicate [New], [Update], or [Delete] for each task

## Anti-Patterns

### 1. Code Snippets in Tasks

**Bad**: Including code snippets or line numbers in task descriptions.

**Example Bad**:

- "Use `messageService.CreateMessageAsync(sessionId, new CreateMessageRequest(...))` to create system message"
- "In `Logic/Services/SessionService.cs` at line 150, add..."
- "call and WebApplication hosting logic from `src/host-wpf/MainWindow.xaml.cs` `InitializeServicesAsync` method (lines 53-67)"

**Good Practice**: Describe what needs to be done, not how to do it with specific code.

### 2. Incorrect File Paths

**Bad**: Assuming file locations without verification.

**Example Bad**: `src/api/Logic/Interfaces/...` (incorrect path)

**Example Good**: `src/api-logic/Interfaces/...` (verified path)

**Good Practice**: Always verify actual file paths in codebase.

### 3. Missing Required Fields in DTOs

**Bad**: Creating DTOs that don't match backend/frontend expectations.

**Example**: Forgetting to add request DTO when creating new endpoint.

**Good Practice**: Check similar endpoints for required DTO patterns.

### 4. Inconsistent Naming Conventions

**Bad**: Using different naming than existing patterns.

**Example Bad**: `ClearHistory` (doesn't match existing terminology)

**Example Good**: `ClearContext` (matches "Reset Context" terminology)

**Good Practice**: Review existing naming for similar features.

### 5. Assuming Component Props Without Verification

**Bad**: Adding props to components without checking current prop interface.

**Good Practice**: Read component files to verify current prop structure.

### 6. Not Checking for Shared Utilities

**Bad**: Implementing new utilities that may already exist in the codebase.

**Good Practice**: Search for similar utilities before adding to tasks.

### 7. Missing Validation in Backend Endpoints

**Bad**: Not validating entity existence before operations.

**Example**: Not checking if session exists before resetting context.

**Good Practice**: Always validate entities exist and are in correct state.

### 8. Task Descriptions Without Code Details

**Bad**: Task descriptions should focus on WHAT needs to be done and WHICH pattern to follow, not HOW to implement it with specific code.

**Example**: Original task had: "Creates system message using `messageService.CreateMessageAsync(sessionId, new CreateMessageRequest(MessageType.System, "Agent history has been cleared", null, null, MessageStatus.Done), cancellationToken)`"

**Good Practice**: "Creates system message using `messageService.CreateMessageAsync` with `CreateMessageRequest` (Type: `MessageType.System`, Content: `"Agent history has been cleared"`, Status: `MessageStatus.Done`)"

### 9. Order Tasks by Dependency Chain

**Bad**: When one task depends on another (e.g., constructor injection before method implementation), order them correctly in the task list.

**Example**: "Add `IMessageService` to constructor" task BEFORE "Implement `ResetContextAsync`" task (Constructor must be updated before the method can use the injected service)

**Good Practice**:

- Identify dependency relationships between tasks
- Order tasks so dependencies come first
- Consider adding "Required for..." notes to clarify relationships

### 10. Reference Existing Patterns for Implementation

**Bad**: Instead of describing full implementation, reference existing similar code as a pattern to follow.

**Examples**:

- Instead of full implementation details, added: "Follow pattern from `CleanMessagesAsync` but create message instead of deleting messages"
- Shortened endpoint task to: "Follow pattern from `ResetSessionEndpoint` and `CleanMessagesEndpoint`"

### 11. Avoid Over-Specification in Conditional Logic Tasks

**Bad**: When tasks involve conditional UI rendering, describe the conditions and what should happen, not the exact syntax.

**Examples**:

- Instead of: "if (step.stepType === WorkflowStepType.ClearContext) { return null; }"
- Used: "Hide content textarea when step type is ClearContext"
- Added: "Follow same pattern as Task step UI logic"

**Good Practice**:

- Describe UI behavior (show/hide/enable/disable)
- Reference existing patterns in the same component
- Let implementer handle conditional logic syntax

### 12. Group Miscellaneous Tasks Appropriately

**Bad**: Scattering miscellaneous tasks throughout the task list.

**Good Practice**: Create a dedicated section for miscellaneous tasks (e.g., project files, documentation, scripts) at the end of the task list. Do not mix them with implementation tasks.

### 13. Clear and Consistent Task Naming

**Bad**: Vague or inconsistent task names that don't clearly indicate the action or location.

**Good Practice**:

- Use clear, descriptive names indicating what is being changed and where
- Include key method/property names
- Include file paths for new files

### 14. Phased Task Organization

**Bad**: Mixing backend, frontend, and tests in a single phase.

**Good Practice**: Organize tasks into clear phases:

- Phase 1: Backend changes
- Phase 2: Frontend changes
- Phase 3: Unit tests and polish

### 15. Sections not from the Template file

**Bad**: Including sections that are not mentioned in the template file.

**Good Practice**: Only include sections that are in the template file. Delete any unnecessary sections.

### 16. Tasks not matching the Template file

**Bad**: Writing tasks that do not follow the structure or format of the template file.

**Example Bad**:

- "- [ ] [New] Create service configuration class `src/host-service/ServiceConfiguration.cs` with properties for URLs, environment, and service name" (New indicator is at the beginning instead of the end)
- "- [ ] Create service configuration class `src/host-service/ServiceConfiguration.cs` with properties for URLs, environment, and service name [New]" (Task name including details)
- "`[Entity]` in `path/to/[Entity].cs` [New/Update]" (Task does not start with "- [ ]")

**Task name structure**: "- [ ] `[Entity]` in `path/to/[Entity].cs` [New/Update]"

**Format Components**:

1. **Checkbox**: ALWAYS start with `- [ ]` (markdown checkbox)
2. **Entity Name**: Component or Entity name. Use backticks `` ` `` around the entity being changed
3. **File Path**:
   - File paths should use forward slashes `/` even on Windows
   - File paths should be surrounded by backticks `` ` `` for clarity
4. **Indicator**: Indicate [New], [Update], or [Delete] for each task
5. **Task details** (optional): Task details like method names, properties, routes, etc. should be in indented bullets below the main task line

---

## Task Structure Best Practices

### Phased Approach

- Phase 1: Backend changes
- Phase 2: Frontend changes
- Phase 3: Unit tests and polish

### Descriptive Task Names

- Include what is being changed and where
- Include key method/property names
- Include file paths for new files
