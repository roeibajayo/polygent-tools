#!/usr/bin/env pwsh

param(
    [Parameter(Position=0, Mandatory=$true)]
    [string]$Filename,

    [Parameter()]
    [switch]$Minimal
)

# Check if file exists
if (-not (Test-Path $Filename)) {
    Write-Error "Error: File `"$Filename`" not found"
    exit 1
}

# Read the file
$content = Get-Content $Filename -Raw
$lines = $content -split "`r?`n"

# Find all uncompleted tasks
$uncompletedTasks = @()

for ($i = 0; $i -lt $lines.Count; $i++) {
    $line = $lines[$i].Trim()

    # Match lines with uncompleted checkboxes: - [ ]
    if ($line -match '^-\s+\[\s*\]\s+(.+)$') {
        $taskDescription = $matches[1].Trim()
        $lineNumber = $i + 1

        $uncompletedTasks += @{
            description = $taskDescription
            line = $lineNumber
        }
    }
}

# If there are uncompleted tasks, report them and exit with error
if ($uncompletedTasks.Count -gt 0) {
    if ($Minimal) {
        # Minimal mode: only output filename:line
        foreach ($task in $uncompletedTasks) {
            Write-Output "- ${Filename}:$($task.line)"
        }
    } else {
        # Standard mode: full error message
        Write-Output "Error: There are $($uncompletedTasks.Count) uncompleted tasks:"
        foreach ($task in $uncompletedTasks) {
            Write-Output "- ${Filename}:$($task.line) $($task.description)"
        }
        Write-Output "`nYou MUST complete ALL tasks!"
    }
    exit 1
}

# All tasks completed
if (-not $Minimal) {
    Write-Output "✓ All tasks completed!"
}
exit 0
