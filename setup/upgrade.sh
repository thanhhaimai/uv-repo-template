#!/usr/bin/env bash

{ # protect against editing while executing

  # Execute in the source dir of the script, regardless where invoked from.
  cd "$(dirname "$0")" || exit

  set -e          # Exit on command failure.
  set -E          # Error traps are inherited.
  set -u          # Exit on use of unset variables.
  set -o pipefail # Exit if any command in a pipeline fails.

  # Source common utilities
  # shellcheck source=/dev/null
  source "setup-utils.sh"

  # Check required commands
  check_required_commands "uv"

  # Change to the project root directory
  cd ".." || exit

  print_section "Verifying Project"

  # Check if we're in a uv project
  if [ ! -f "pyproject.toml" ]; then
    echo "ERROR: pyproject.toml not found. Are you in a uv project directory?"
    exit 1
  fi

  # Check if uv.lock exists
  if [ ! -f "uv.lock" ]; then
    echo "WARNING: uv.lock not found. This will create a new lock file."
  fi

  # Upgrade Python
  print_section "Upgrading Python"
  echo "Upgrading Python to latest version..."
  uv python upgrade

  # Upgrade all dependencies
  print_section "Upgrading Dependencies"
  echo "Upgrading all dependencies to latest compatible versions..."
  uv lock --upgrade

  # Upgrade all tools
  print_section "Upgrading Tools"
  echo "Upgrading all tools to latest versions..."
  uv tool upgrade --all

  # Sync the environment with updated dependencies
  print_section "Syncing Environment"
  echo "Syncing virtual environment with updated dependencies..."
  uv sync --all-packages

  # Run tests to ensure everything still works
  print_section "Running Tests"
  echo "Running tests to verify compatibility..."
  if uv run pytest; then
    echo "All tests passed"
  else
    echo "Tests failed"
    exit 1
  fi

  echo "Dependency upgrade completed successfully!"

} # protect against editing while executing