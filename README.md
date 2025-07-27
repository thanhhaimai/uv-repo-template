# uv-repo-template

A template repo with most common python tooling setup (uv, pre-commit, ruff, pytest,...)

## Setup

### Prerequisites

- Install Homebrew first: <https://brew.sh/>

### Initial Setup

Run `setup/setup.sh` for one-time setup. The script is designed to be idempotent - you can safely re-run it multiple times without issues.

#### What `setup.sh` does:

- **Installs required tools**: Uses Homebrew to install `uv` (Python package manager) and `direnv` (environment management)
- **Sets up dependencies**: Syncs project dependencies using `uv sync` (creates lock file if none exists)
- **Configures pre-commit**: Installs pre-commit hooks for code quality checks
- **Environment setup**: Ensures your development environment is ready for the project

## Usage

To create a new library:

```bash
uv init --lib example-lib
```

To create a new app:

```bash
uv init --app example-app
```
