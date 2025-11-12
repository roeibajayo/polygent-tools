# Claude Tools

A collection of Claude Code tools and workflows for structured project development.

## Installation

Run one of the following commands from your project directory:

### Quick Install (Recommended)

**Linux/Mac:**

```bash
curl -fsSL https://raw.githubusercontent.com/roeibajayo/claude-tools/main/install.sh | bash
```

**Windows (PowerShell):**

```powershell
irm https://raw.githubusercontent.com/roeibajayo/claude-tools/main/install.ps1 | iex
```

### Manual Install

If you prefer to review the script before running:

**Linux/Mac:**

```bash
curl -o install.sh https://raw.githubusercontent.com/roeibajayo/claude-tools/main/install.sh
chmod +x install.sh
./install.sh
rm install.sh  # Optional cleanup
```

**Windows (PowerShell):**

```powershell
curl -o install.ps1 https://raw.githubusercontent.com/roeibajayo/claude-tools/main/install.ps1
.\install.ps1
rm install.ps1  # Optional cleanup
```

### What It Does

The installation script:

1. Clones the repository with `--depth 1` (shallow clone)
2. Copies all `.claude/` files to your project's `.claude/` directory
3. Automatically cleans up the temporary clone

## Updating

To update to the latest version, simply run the installation command again. The script will fetch the latest version and update your `.claude/` files.
