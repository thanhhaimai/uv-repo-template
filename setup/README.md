# Setup Scripts

This directory contains setup and maintenance scripts for the repository.

## Scripts Overview

- **`setup.sh`**: Initial development environment setup
- **`upgrade.sh`**: Comprehensive environment upgrade and maintenance

## `setup.sh` - Initial Setup

The initial setup script that prepares your development environment for the first time.

The script is designed to be idempotent - you can safely re-run it multiple times without issues.

### What it does

- **Installs required tools**: Uses Homebrew to install `uv` (Python package manager) and `direnv` (environment management)
- **Sets up dependencies**: Syncs project dependencies using `uv sync` (creates lock file if none exists)
- **Configures pre-commit**: Installs pre-commit hooks for automated code quality checks
- **Environment preparation**: Ensures your development environment is ready for the project

### Prerequisites

- Homebrew installed (`brew` command available)
- macOS or Linux with Homebrew support

### Usage

```bash
./setup/setup.sh
```

## `upgrade.sh` - Comprehensive Upgrade

Comprehensive upgrade script that upgrades Python, dependencies, tools, and runs the full test suite.

### What gets upgraded

- **Python**: Latest Python version via `uv python upgrade`
- **Dependencies**: All project dependencies via `uv lock --upgrade`
- **Tools**: All development tools via `uv tool upgrade --all`
- **Environment**: Virtual environment synchronization

### Prerequisites

- `setup/setup.sh` has been run successfully
- A valid `pyproject.toml` file in the project root
- Existing `uv.lock` file (created by initial setup)

### Usage

```bash
./setup/upgrade.sh
```

## Best Practices

### For Initial Setup

1. **Run setup first**: Always run `setup.sh` before any other operations
1. **Verify installation**: Check that `uv` and `direnv` are available after setup

### For Upgrades

1. **Regular upgrades**: Run the upgrade script periodically to keep your environment current
1. **Review changes**: Always review the `uv.lock` changes before committing
1. **Test thoroughly**: The comprehensive script runs your full test suite automatically
1. **Incremental approach**: If issues arise, consider upgrading packages one by one

## Troubleshooting

### Setup Script Issues

#### Script fails with "brew command not found"

- Install Homebrew first: <https://brew.sh/>

### Upgrade Script Issues

#### Script fails with "uv command not found"

- Ensure `setup/setup.sh` has been run successfully

#### Tests fail after upgrade

This indicates a compatibility issue. Consider:

- Rolling back the upgrade by restoring the previous `uv.lock`
- Upgrading packages one by one to identify the problematic package
- Checking the package's changelog for breaking changes
- Reviewing test output for specific failure details

#### Tool upgrade fails

- Some tools may require manual intervention
- Check tool-specific documentation for upgrade requirements
- Consider upgrading tools individually if needed
- Verify tool compatibility with your Python version

### General Issues

#### Lock file conflicts

- If `uv.lock` has conflicts, consider regenerating it with `uv lock --upgrade`
- Review dependency compatibility in `pyproject.toml`

#### Environment inconsistencies

- Run `uv sync --all-packages` to synchronize your environment with the lock file
