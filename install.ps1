#!/usr/bin/env pwsh
# install.ps1 - Install Claude Tools
#
# Usage:
#   # From any project directory:
#   irm https://raw.githubusercontent.com/roeibajayo/polygent-tools/main/install.ps1 | iex
#
#   # Or download and run locally:
#   curl -o install.ps1 https://raw.githubusercontent.com/roeibajayo/polygent-tools/main/install.ps1
#   ./install.ps1

$ErrorActionPreference = "Stop"

$REPO_URL = "https://github.com/roeibajayo/polygent-tools.git"
$TEMP_DIR = ".polygent-tools-temp"
$TARGET_DIR = ".claude"

Write-Host "Claude Tools Installer" -ForegroundColor Cyan
Write-Host "======================" -ForegroundColor Cyan
Write-Host ""

# Check if git is available
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "ERROR: git is not installed or not in PATH" -ForegroundColor Red
    exit 1
}

# Check if we're in a project directory (optional warning)
if (-not (Test-Path "package.json") -and -not (Test-Path ".git")) {
    Write-Host "WARNING: No package.json or .git found. Are you in a project directory?" -ForegroundColor Yellow
    $response = Read-Host "Continue anyway? (y/N)"
    if ($response -ne "y" -and $response -ne "Y") {
        Write-Host "Installation cancelled." -ForegroundColor Yellow
        exit 0
    }
    Write-Host ""
}

# Clean up any existing temp directory
if (Test-Path $TEMP_DIR) {
    Write-Host "Cleaning up existing temp directory..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force $TEMP_DIR
}

try {
    # Clone the repository with shallow depth
    Write-Host "Cloning repository..." -ForegroundColor Yellow
    git clone --depth 1 $REPO_URL $TEMP_DIR 2>&1 | Out-Null
    if ($LASTEXITCODE -ne 0) {
        throw "Failed to clone repository"
    }
    Write-Host "  Repository cloned successfully" -ForegroundColor Green
    Write-Host ""

    # Check if source .claude directory exists
    $SOURCE_DIR = Join-Path $TEMP_DIR ".claude"
    if (-not (Test-Path $SOURCE_DIR)) {
        throw "Source .claude directory not found in repository"
    }

    # Create target directory if it doesn't exist
    if (-not (Test-Path $TARGET_DIR)) {
        Write-Host "Creating .claude directory..." -ForegroundColor Yellow
        New-Item -ItemType Directory -Path $TARGET_DIR | Out-Null
    }

    # Copy files
    Write-Host "Copying files..." -ForegroundColor Yellow
    $copiedFiles = @()
    Get-ChildItem -Path $SOURCE_DIR -Recurse | ForEach-Object {
        $targetPath = $_.FullName.Replace($SOURCE_DIR, $TARGET_DIR)

        if ($_.PSIsContainer) {
            # Create directory
            if (-not (Test-Path $targetPath)) {
                New-Item -ItemType Directory -Path $targetPath | Out-Null
            }
        }
        else {
            # Copy file
            Copy-Item -Path $_.FullName -Destination $targetPath -Force
            $relativePath = $_.FullName.Replace($SOURCE_DIR + '\', '')
            Write-Host "  Copied: $relativePath" -ForegroundColor Green
            $copiedFiles += $relativePath
        }
    }

    Write-Host ""
    Write-Host "Installation complete!" -ForegroundColor Green
    Write-Host ""
    Write-Host "The following files were installed to .claude/:" -ForegroundColor Cyan
    $copiedFiles | ForEach-Object {
        Write-Host "  - $_" -ForegroundColor Gray
    }
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "ERROR: Installation failed: $_" -ForegroundColor Red
    exit 1
}
finally {
    # Clean up temp directory
    if (Test-Path $TEMP_DIR) {
        Write-Host "Cleaning up..." -ForegroundColor Yellow
        Remove-Item -Recurse -Force $TEMP_DIR
        Write-Host "  Temp directory removed" -ForegroundColor Green
        Write-Host ""
    }
}
