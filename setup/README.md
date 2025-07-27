# Setup Scripts

This directory contains setup and maintenance scripts for the repository.

## Usage

### Comprehensive Upgrade

To perform a complete upgrade of your development environment:

```bash
./setup/upgrade.sh
```

## `setup.sh`

Initial setup script that installs required tools and sets up the development environment.

## `upgrade.sh`

Comprehensive upgrade script that upgrades Python, dependencies, tools, and runs the full test suite.

### What Gets Upgraded

- **Python**: Latest Python version via `uv python upgrade`
- **Dependencies**: All project dependencies via `uv lock --upgrade`
- **Tools**: All development tools via `uv tool upgrade --all`
- **Environment**: Virtual environment synchronization

### Prerequisites

The upgrade script requires:

- `setup/setup.sh` is run
- A valid `pyproject.toml` file in the project root

## Best Practices

1. **Regular upgrades**: Run the upgrade script periodically to keep your environment current
1. **Review changes**: Always review the `uv.lock` changes before committing
1. **Test thoroughly**: The comprehensive script runs your full test suite automatically
1. **Backup**: Consider backing up your `uv.lock` before major upgrades

## Troubleshooting

### Script fails with "uv command not found"

Make sure `setup/setup.sh` is run first

### Script fails with "pyproject.toml not found"

Make sure you're running the script from a valid uv project directory.

### Tests fail after upgrade

This indicates a compatibility issue. Consider:

- Rolling back the upgrade
- Upgrading packages one by one to identify the problematic package
- Checking the package's changelog for breaking changes
- Reviewing test output for specific failure details

### Python upgrade fails

- Ensure you have sufficient permissions to install Python
- Check available disk space
- Verify network connectivity for downloading Python

### Tool upgrade fails

- Some tools may require manual intervention
- Check tool-specific documentation for upgrade requirements
- Consider upgrading tools individually if needed
