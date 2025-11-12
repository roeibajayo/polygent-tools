#!/usr/bin/env bash
# install.sh - Install Claude Tools
#
# Usage:
#   # From any project directory:
#   curl -fsSL https://raw.githubusercontent.com/roeibajayo/polygent-tools/main/install.sh | bash
#
#   # Or download and run locally:
#   curl -o install.sh https://raw.githubusercontent.com/roeibajayo/polygent-tools/main/install.sh
#   chmod +x install.sh
#   ./install.sh

set -e

REPO_URL="https://github.com/roeibajayo/polygent-tools.git"
TEMP_DIR=".polygent-tools-temp"
TARGET_DIR=".claude"

echo -e "\033[36mClaude Tools Installer\033[0m"
echo -e "\033[36m======================\033[0m"
echo ""

# Check if git is available
if ! command -v git &> /dev/null; then
    echo -e "\033[31mERROR: git is not installed or not in PATH\033[0m"
    exit 1
fi

# Check if we're in a project directory (optional warning)
if [ ! -f "package.json" ] && [ ! -d ".git" ]; then
    echo -e "\033[33mWARNING: No package.json or .git found. Are you in a project directory?\033[0m"
    read -p "Continue anyway? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "\033[33mInstallation cancelled.\033[0m"
        exit 0
    fi
    echo ""
fi

# Clean up any existing temp directory
if [ -d "$TEMP_DIR" ]; then
    echo -e "\033[33mCleaning up existing temp directory...\033[0m"
    rm -rf "$TEMP_DIR"
fi

# Function to clean up on exit
cleanup() {
    if [ -d "$TEMP_DIR" ]; then
        echo -e "\033[33mCleaning up...\033[0m"
        rm -rf "$TEMP_DIR"
        echo -e "  \033[32mTemp directory removed\033[0m"
        echo ""
    fi
}

# Set trap to clean up on exit (success or failure)
trap cleanup EXIT

# Clone the repository with shallow depth
echo -e "\033[33mCloning repository...\033[0m"
if git clone --depth 1 "$REPO_URL" "$TEMP_DIR" 2>&1; then
    echo -e "  \033[32mRepository cloned successfully\033[0m"
    echo ""
else
    echo -e "\033[31mERROR: Failed to clone repository\033[0m"
    exit 1
fi

# Check if source .claude directory exists
SOURCE_DIR="$TEMP_DIR/.claude"
if [ ! -d "$SOURCE_DIR" ]; then
    echo -e "\033[31mERROR: Source .claude directory not found in repository\033[0m"
    exit 1
fi

# Create target directory if it doesn't exist
if [ ! -d "$TARGET_DIR" ]; then
    echo -e "\033[33mCreating .claude directory...\033[0m"
    mkdir -p "$TARGET_DIR"
fi

# Copy files and track what was copied
echo -e "\033[33mCopying files...\033[0m"
COPIED_FILES=()
find "$SOURCE_DIR" -type f | while read -r file; do
    rel_path="${file#$SOURCE_DIR/}"
    target_file="$TARGET_DIR/$rel_path"

    # Create parent directory if needed
    mkdir -p "$(dirname "$target_file")"

    # Copy file
    cp "$file" "$target_file"
    echo -e "  \033[32mCopied: $rel_path\033[0m"
    echo "$rel_path" >> "$TEMP_DIR/.copied_files"
done

echo ""
echo -e "\033[32mInstallation complete!\033[0m"
echo ""
echo -e "\033[36mThe following files were installed to .claude/:\033[0m"
if [ -f "$TEMP_DIR/.copied_files" ]; then
    while read -r rel_path; do
        echo -e "  \033[90m- $rel_path\033[0m"
    done < "$TEMP_DIR/.copied_files"
fi
echo ""

# Note: cleanup will happen automatically via trap
