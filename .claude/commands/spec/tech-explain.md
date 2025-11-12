---
name: Spec:Tech-Explain
description: Explain technical details of the user's request before proceeding.
---

# Explanation of User Request

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

Think about what the user is asking for, then produce a concise explanation of the user's request.
Describe user/logic flows using components/pages/endpoints to illustrate the process.
The goal here is to ensure you fully understand the user's request.
Read files as needed to clarify the request.
The final output should be a explanation of the user's request, not an implementation plan.
STRICTLY READ-ONLY: Do not modify any files.

## Command Checklist

- [ ] Ensure `temp-spec/explain.md` is loaded to context, if exists. If not exists then clean all files from `temp-spec/` directory.
- [ ] Produce a concise explanation of the user's request, following the `Explanation Guidelines` below, save in `temp-spec/tech-explain.md`.
- [ ] Ensure no disallowed details are included - remove if found.
- [ ] Ensure no bad examples are present - remove if found.

## Explanation Guidelines

- Ultra think and focus on **HOW** to implement the user's needs in high-level technical terms, not business terms or implementation details.
- Written by Team Leader for his developers, to clarify what needs to be built.
- Should includes ALL details to extract tasks for implementation.
- No mention of frameworks, languages, databases, or tools.
- Be specific about features or functionality requested.
- DO NOT create any checklists that are embedded in the spec. That will be a separate command.
- List involved Components, Pages, Services, Endpoints, and their interactions (high-level only, no code).
- Be concise, clear, short and to the point.
- Highlight any specific requirements or constraints mentioned by the user.
- Include any relevant context that helps clarify the request, including Components, Pages, Services or Features involved.
- DO NOT include technical details like Files, Models, DTOs, Interfaces, Repositories etc.
- Use context, industry standards, and common patterns to fill gaps.
- DO NOT include implementation details.
- DO NOT include current state information.
- Fix user typographical or grammatical errors.
- ALWAYS output in English only, no matter the input language.
- Format the explanation in markdown.

### Disallowed Details

- Data retention: Industry-standard practices for the domain.
- Performance targets: Standard web/mobile app expectations unless specified.
- Error handling: User-friendly messages with appropriate fallbacks.
- Authentication method: Standard session-based or OAuth2 for web apps.
- Integration patterns: RESTful APIs unless specified otherwise.

### Bad Examples

- Output containing implementation details (e.g., "use React for frontend").
- Output focusing on technical specifications (e.g., "the API should return JSON").
- Output that is too vague or generic (e.g., "improve user experience").
- Output containing checklists or task lists.
- Output containing current state analysis or assumptions about existing systems.
- Output containing explanations of why the request matters.
- Output containing code, methods, classes, variables, or technical terms.
- Output containing sections such as "Why This Matters", "Current State", "What's Missing" or "Constraints & Context", etc.

### Bad outputs style

- "API response time is under 200ms" (too technical, use "Users see results instantly").
- "Database can handle 1000 TPS" (implementation detail, use user-facing metric).
- "React components render efficiently" (framework-specific).
- "Redis cache hit rate above 80%" (technology-specific).

### Good Example

<user-request>
i want to add commit button to Git Changes tab
</user-request>

<output>

# Explanation: Add Commit Button to Git Changes Tab

## What You Need

Users need the ability to **commit staged changes** directly from the `Git Changes` tab in the `Session` sidebar.

## User Flow Needed

1. User navigates to `Session` page.
2. User opens `Git Changes` tab from the sidebar.
3. User clicks a `Commit` button (only enabled when staged files exist)
4. User enters a commit message in a dialog/modal
5. User confirms the commit action
6. Client sends commit request to `CommitChanges` endpoint
7. Server validates request inputs
8. Server executes the commit operation using `GitService`
9. User sees success confirmation or error message
10. User sees the staged changes list clear after successful commit

## New Components Needed

1. `CommitChanges` Endpoint: New API endpoint to handle commit requests
2. `GitService` Service: New git service to execute the commit operation

</output>
