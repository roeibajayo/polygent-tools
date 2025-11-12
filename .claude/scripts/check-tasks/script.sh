#!/usr/bin/env bash

set -e

# Parse command line arguments
MINIMAL_MODE=false
FILENAME=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --minimal)
            MINIMAL_MODE=true
            shift
            ;;
        -*)
            echo "Error: Unknown option $1" >&2
            exit 1
            ;;
        *)
            FILENAME="$1"
            shift
            ;;
    esac
done

# Check if filename was provided
if [[ -z "$FILENAME" ]]; then
    echo "Error: Please provide a filename as an argument" >&2
    echo "Usage: check-tasks.sh <filename> [--minimal]" >&2
    exit 1
fi

# Check if file exists
if [[ ! -f "$FILENAME" ]]; then
    echo "Error: File \"$FILENAME\" not found" >&2
    exit 1
fi

# Find all uncompleted tasks
UNCOMPLETED_TASKS=()
LINE_NUMBERS=()

while IFS= read -r line || [[ -n "$line" ]]; do
    ((LINE_NUMBER++)) || true

    # Trim the line and match uncompleted checkboxes: - [ ]
    TRIMMED_LINE=$(echo "$line" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

    if [[ "$TRIMMED_LINE" =~ ^-[[:space:]]+\[[[:space:]]*\][[:space:]]+(.+)$ ]]; then
        TASK_DESCRIPTION="${BASH_REMATCH[1]}"
        UNCOMPLETED_TASKS+=("$TASK_DESCRIPTION")
        LINE_NUMBERS+=("$LINE_NUMBER")
    fi
done < "$FILENAME"

# If there are uncompleted tasks, report them and exit with error
if [[ ${#UNCOMPLETED_TASKS[@]} -gt 0 ]]; then
    if [[ "$MINIMAL_MODE" = true ]]; then
        # Minimal mode: only output filename:line
        for i in "${!LINE_NUMBERS[@]}"; do
            echo "- $FILENAME:${LINE_NUMBERS[$i]}"
        done
    else
        # Standard mode: full error message
        echo "Error: There are ${#UNCOMPLETED_TASKS[@]} uncompleted tasks:" >&2
        for i in "${!UNCOMPLETED_TASKS[@]}"; do
            echo "- $FILENAME:${LINE_NUMBERS[$i]} ${UNCOMPLETED_TASKS[$i]}" >&2
        done
        echo "" >&2
        echo "You MUST complete ALL tasks!" >&2
    fi
    exit 1
fi

# All tasks completed
if [[ "$MINIMAL_MODE" = false ]]; then
    echo "✓ All tasks completed!"
fi
exit 0
