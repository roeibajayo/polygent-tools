#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

// Parse command line arguments
const args = process.argv.slice(2);
const minimalMode = args.includes('--minimal');
const filename = args.find((arg) => !arg.startsWith('--'));

if (!filename) {
  console.error('Error: Please provide a filename as an argument');
  console.error('Usage: node check-tasks.js <filename> [--minimal]');
  process.exit(1);
}

// Check if file exists
if (!fs.existsSync(filename)) {
  console.error(`Error: File "${filename}" not found`);
  process.exit(1);
}

// Read the file
const content = fs.readFileSync(filename, 'utf-8');
const lines = content.split('\n');

// Find all uncompleted tasks
const uncompletedTasks = [];

lines.forEach((line, index) => {
  // Match lines with uncompleted checkboxes: - [ ]
  // Trim the line to handle Windows line endings (\r\n)
  const trimmedLine = line.trim();
  const match = trimmedLine.match(/^-\s+\[\s*\]\s+(.+)$/);
  if (match) {
    const taskDescription = match[1].trim();
    const lineNumber = index + 1;
    uncompletedTasks.push({
      description: taskDescription,
      line: lineNumber
    });
  }
});

// If there are uncompleted tasks, report them and exit with error
if (uncompletedTasks.length > 0) {
  if (minimalMode) {
    // Minimal mode: only output filename:line
    uncompletedTasks.forEach((task) => {
      console.log(`- ${filename}:${task.line}`);
    });
  } else {
    // Standard mode: full error message
    console.error(
      `Error: There are ${uncompletedTasks.length} uncompleted tasks:`
    );
    uncompletedTasks.forEach((task) => {
      console.error(`- ${filename}:${task.line} ${task.description}`);
    });
    console.error('\nYou MUST complete ALL tasks!');
  }
  process.exit(1);
}

// All tasks completed
if (!minimalMode) {
  console.log('✓ All tasks completed!');
}
process.exit(0);
