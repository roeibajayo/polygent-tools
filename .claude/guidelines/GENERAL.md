# IMPORTANT General Guidelines

- ALWAYS prefer to use Skill tool, even if you have a doubt about whether to load a Skill or not - you ABSOLUTELY MUST load the skill.
- NEVER leave comments like "in the meantime, simulate...", "TODO: implement", "For now we'll just ... in a real implementation ..." etc. ALWAYS FULLY implement the user's request, whether the request is small or large, without leaving placeholders. If you need more context or information to complete the request, ask for it explicitly.
- NEVER try to resolve build errors by removing the problematic files or code.
- NEVER execute database queries, and don't apply any migrations or schema changes.
- NEVER drop database databases, tables or collections.
- If the user points to a specific file called "GetFiles.cs" and you didn't find such file, but you did find a file named "GetFile.cs" in the repository, use that file, because it is likely a typo. This applies to all files, paths, references, functions, or variables, not just the one mentioned.
- Don't modify existing files that are ignored by `.gitignore`.
- If the files you edit are changed by the user - you should not change them back, unless the user explicitly asks you to do so.
- NEVER log sensitive data (API keys, passwords, tokens).
- NEVER expose internal IDs in error messages.
- NEVER duplicate code or functionality, always search for existing solutions before implementing new ones. if you find duplicate code, refactor it into a shared function or component, if not - create a new one.
- NEVER duplicate implementations, always share code between similar features.
- ALWAYS use int enums with starting values of 1, whether in TypeScript or C#. NEVER use string enums.
- ALWAYS use English for all code, comments, and documentation. No exceptions.
- Correct spelling and grammar in all user-facing text.
- When you are not sure or your confidence is below 80%, ask the user for clarification, guidance or more context.
- When asking for clarification, guidance or more context, consider presenting a Multiple choice style choice for the user on how to move forward.

# IMPORTANT Backend-Frontend Integration

- ALL Request and Response models must be shared between Frontend and Backend. If you create a new model or modify an existing one, ensure it is reflected in both projects.
- The server's json output naming convention is camelCase, and the TypeScript interface should be camelCase.

# IMPORTANT Testing

- Follow Arrange-Act-Assert pattern.
- Mock external dependencies for isolated testing.
