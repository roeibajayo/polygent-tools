# CLAUDE.md

## Repository Purpose

This is a collection of Claude Code tools and workflows for project development. It provides:

- Slash commands for task generation, implementation, and documentation optimization
- Skills for refactoring assistance and skill creation
- Task management templates for structured feature development

## Installation Method

This repository provides a simple installation script that can be run from any project:

**Quick Install:**

- Linux/Mac: `curl -fsSL https://raw.githubusercontent.com/roeibajayo/claude-tools/main/install.sh | bash`
- Windows: `irm https://raw.githubusercontent.com/roeibajayo/claude-tools/main/install.ps1 | iex`

**How It Works:**

1. Clones the repository with `--depth 1` (shallow clone) to a temporary directory
2. Copies all `.claude/` files to your project's `.claude/` directory
3. Automatically cleans up the temporary clone

**Benefits:**

- Single command installation (no git submodules needed)
- Minimal disk space usage (shallow clone)
- Automatic cleanup
- Easy updates by re-running the same command

## Development Commands

### Formatting

```bash
npm run format
```

Formats all files using Prettier with the project's configuration.
