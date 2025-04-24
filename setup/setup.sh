#!/usr/bin/env bash

{ # protect against editing while executing

  # Execute in the source dir of the script, regardless where invoked from.
  cd "$(dirname "$0")" || exit

  # Make sure we have all the required utilities installed
  REQUIRED_COMMANDS=("brew")
  for cmd in "${REQUIRED_COMMANDS[@]}"; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
      echo "$cmd command not found"
      echo "Please install it manually according to README.md"
      exit 1
    fi
  done

  set -e
  set -x

  # Update brew and install required tools
  brew update
  brew install uv
  brew install direnv

  # If uv.lock exists, sync with locked dependencies; otherwise, sync all packages
  if [ ! -f "../uv.lock" ]; then
    uv sync --all-packages
  else
    uv sync --locked --all-packages
  fi

  # Set up pre-commit hooks
  uv run pre-commit install
}
