---
name: Spec:Explain
description: Explain the user's request before proceeding.
---

# Explanation of User Request

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

Think about what the user is asking for, then produce a concise explanation of the user's request.
The goal here is to ensure you fully understand the user's request.
Read files as needed to clarify the request.
The final output should be a explanation of the user's request, not an implementation plan.
STRICTLY READ-ONLY: Do not modify any files.

## Command Checklist

- [ ] Clean all files from `temp-spec/` directory.
- [ ] Produce a concise explanation of the user's request, following the `Explanation Guidelines` below, save in `temp-spec/explain.md`.
- [ ] Ensure no disallowed details are included - remove if found.
- [ ] Ensure no bad examples are present - remove if found.

## Explanation Guidelines

- Ultra think and focus on **WHAT** users need and **WHY**.
- Avoid HOW to implement (No mention of frameworks, languages, databases, or tools).
- Written for business stakeholders, not developers.
- Describe outcomes from user/business perspective, not system internals.
- Describe user/logic flows, if applicable.
- Be specific about features or functionality requested.
- DO NOT create any checklists that are embedded in the spec. That will be a separate command.
- Be concise, clear, short and to the point.
- Highlight any specific requirements or constraints mentioned by the user.
- Include any relevant context that helps clarify the request, including Components, Pages, Services or Features involved.
- DO NOT include technical details like Files, Models, DTOs, Interfaces, Repositories, Endpoints etc.
- Suggest improvements to the user's request if applicable.
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
- Output containing sections such as "Why This Matters", "Current State", "What's Missing", "Components Involved" or "Constraints & Context", etc.

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

When users have staged changes, they should be able to:

1. Click a "Commit" button (only enabled when staged files exist)
2. Enter a commit message in a dialog/modal
3. Confirm the commit action
4. See success confirmation or error message
5. See the staged changes list clear after successful commit

## Suggested Improvements

Consider adding:

- Amend last commit option (for users who want to modify their most recent commit)
- Commit message suggestions based on changed files
- Recent commits view to see commit history within the session

</output>
