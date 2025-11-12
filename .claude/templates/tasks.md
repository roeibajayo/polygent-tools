---
description: Task list template for feature implementation.
---

# Tasks: [FEATURE NAME]

<!--
  IMPORTANT: The tasks below are SAMPLE TASKS for illustration purposes only.

  - You MUST replace these with actual tasks
  - Delete component sections (Models, DTOs, etc.) that aren't needed for a project

  DO NOT keep these sample tasks in the generated tasks.md file.
!-->

## Feature Overview

<!-- Short description of the feature to be implemented, max 2 lines -->

### [Flow]

<!--
  OPTIONAL: If applicable, describe user/logic flows involved in the feature.
  Repeat as needed for multiple flows.
  Delete this section if not needed.

  Example:
  ### User Registration Flow
  1. User navigates to `Registration` page
  2. User fills out registration form
  3. User submits form
  4. System validates input and creates user account
  5. Call `SendWelcomeEmail` endpoint to send welcome email
-->

## Phase 1: [Project Title] (P1)

Load skills using Skill tool: <!-- DELETE this line if not applicable -->

- `[Skill]` <!-- repeat as needed -->

Load guidelines: <!-- DELETE this line if not applicable -->

- `path/to/guideline.md` <!-- repeat as needed -->

<!-- DELETE sections below that aren't needed for this project -->

### [Service] / [Repository] / [Manager]

- [ ] `[Service]` in `path/to/[Service].cs` [New/Update]
  - Implement [Interface] <!-- if applicable -->
    - [ReturnType] [Method]([ParamType] [param]) <!-- repeat as needed, only if interface is new -->
  - [ReturnType] [Method]([ParamType] [param]) <!-- repeat as needed -->
    - Calls [Service].[Method]([param]) <!-- if applicable, repeat as needed -->

### Endpoints

- [ ] `[Endpoint]` in `path/to/[Endpoint].cs` [New/Update]
  - Route: [HTTPMethod] `[resource-path]`
  - Request: [RequestDto] <!-- if no DTO - replace RequestDto with request properties -->
  - Response: [ResponseDto] <!-- if no DTO - replace ResponseDto with response properties -->
  - Calls [Service].[Method]([param]) <!-- if applicable, repeat as needed -->
  - Used by: `[Page/Component]` <!-- if applicable, repeat as needed -->

### Models / DTOs / Entities

- [ ] `[Model]` in `path/to/[Model].cs` [New/Update]
  - Properties: [prop1], [prop2] <!-- repeat as needed -->

### Database Migration

- [ ] `[Table]` in `path/to/[Table].cs` [New/Update/Remove]
  - Columns: [Column1], [Column2] <!-- if applicable, repeat as needed -->

### [Page] (Frontend)

- [ ] `[Page]` in `path/to/[Page]/index.tsx` [New/Update]
  - Route: `/[route-path]`
  - Hook: `use[Page]` in `path/to/[Page]/use[Page].ts`
    - Methods: [method1], [method2] <!-- repeat as needed -->
    - Calls Endpoints: [Service1], [Service2] <!-- if applicable, repeat as needed -->
  - New Components: [Header], [Content], [Footer] <!-- if applicable, repeat as needed -->
  - Reuses Components: [Sidebar] <!-- if applicable, repeat as needed -->
  - New Shared Components: [Button] in `path/to/[Component].tsx` <!-- if applicable, repeat as needed -->

### Shared React Components

- [ ] `[Component]` in `path/to/[Component].tsx` [New/Update]
  - Props: [prop1], [prop2] <!-- repeat as needed -->

### Shared React Hooks

- [ ] `use[Hook]` in `path/to/[Hook].ts` [New/Update]
  - Returns { [state1], [method1] }

### Unit Tests

- [ ] `[Service]` in `path/to/[Service].cs` [New/Update]
  - [TestMethod] <!-- only unit test name, no additional context or info. repeat as needed -->

### Other Tasks <!-- project file, docs, scripts, configurations etc.. -->

- [ ] `[Entity]` in `path/to/[Entity].cs` [New/Update] <!-- repeat as needed -->

---

<!-- Copy phase template above to add more user stories -->

---

## Phase N: Polish

- [ ] Refactor React Components using `react-page-refactor` Skill
- [ ] Refactor .NET Services and Managers using `dotnet-refactor` Skill
- [ ] Full backend build: `dotnet build` (for example)
- [ ] Full frontend checks: `cd src/client && npx tsc --noEmit --skipLibCheck --project tsconfig.app.json && npx eslint .` (for example)
- [ ] Validate all unit tests pass
- [ ] Format files: `cd src/client && npx prettier <files> --write` (for example)
