# uv-repo-template

A monorepo Python projects template with modern tooling setup including `uv`
(fast Python package manager), `pre-commit` hooks, `ruff` (linter),
`ty` (type checking), `pytest` (testing), and more.

NOTE: This repo is opinionated and is useful as a reference.
I encourage the readers to learn more about each tools and set up their own repo suitable for their workflow.

## Features

- **Modern Python Tooling**: Uses `uv` for fast dependency management and builds
- **Testing**: `pytest` setup with coverage reporting, watch, and cache
- **Pre-commit Hooks**: Automated code quality checks on commit. Pre-configured
  with `ruff` and `mdformat` for linting and formatting
- **Type Safety**: Type checking support with `ty`
- **Workspace Structure**: Monorepo workspace with example library and
  application
- **Development Environment**: Automated setup and upgrade scripts

## Project Structure

```
uv-repo-template/
├── example-app/          # Example application package
│   ├── src/example_app/
│   └── pyproject.toml
├── example-lib/          # Example library package
│   ├── src/example_lib/
│   └── pyproject.toml
├── setup/               # Setup and maintenance scripts
├── pyproject.toml       # Root workspace configuration
└── README.md
```

## Prerequisites

- **macOS or Linux** with Homebrew support
- **Homebrew** installed ([install here](https://brew.sh/))

NOTE: If you haven't used `brew` on Linux, consider giving it a try. It's nice
to have a simple way to install dependencies supporting both Linux / Mac.

## Quick Start

### 1. Use the template

Click the "Use this template" button (top right, next to the star button) at:
https://github.com/thanhhaimai/uv-repo-template

### 1. Initial Setup

Run the setup script to configure your development environment:

```bash
./setup/setup.sh
```

This script will:

- Install `uv` (Python package manager) and `direnv` (environment management)
- Set up project dependencies and create lock file
- Configure pre-commit hooks

Allows direnv for workspace root when prompted:

```bash
direnv allow
```

### 2. Verify Installation

Check that everything is working:

```bash
# Run tests
uv run pytest

# Run all pre-commit checks
uv run pre-commit run --all-files
```

## Usage

### Creating New Packages

#### Create a new library:

```bash
uv init --lib my-library
```

#### Create a new application:

```bash
uv init --app my-application
```

### Manually run `pre-commit`

```bash
uv run pre-commit run --all-files
```

### Package Management

Dependencies are managed by `uv`.
See `pyproject.toml` for details.

```bash
# Add a prod package
uv add package-name

# Add a dev package
uv add --dev package-name

# Remove a package
uv remove package-name

# Upgrade package / python / tools / pre-commit verions
./setup/upgrade.sh
```

### Testing

Tests are organized with the following conventions:

- Test files end with `_test.py`
- Tests are placed in the same directory as source code
- Use `pytest` for running tests

```bash
# Run all tests
uv run pytest

# Run tests with coverage
uv run pytest --cov

# Run only the tests for changed files
uv run pytest --testmon

# Run tests in watch mode (watch for changed files)
uv run ptw --testmon --now .
```

### Environment Management

The project uses `direnv` for automatic environment activation. When you enter the project directory, the Python environment will be automatically activated.

## Maintenance

### Regular Updates

Keep your environment up to date with the upgrade script:

```bash
./setup/upgrade.sh
```

This will:

- Upgrade Python to the latest version
- Update all dependencies
- Upgrade development tools
- Update pre-commit hooks
- Run the full test suite

### Troubleshooting

#### Common Issues

1. **"brew command not found"**: Install Homebrew first
1. **"uv command not found"**: Run `./setup/setup.sh` again
1. **Lock file conflicts**: Regenerate with `uv lock --upgrade`

For more detailed troubleshooting, see [setup/README.md](setup/README.md).

#### Tests fail after upgrade

This indicates a compatibility issue. Consider:

1. **Rollback**: Restore the previous `uv.lock` file
1. **Incremental upgrade**: Upgrade packages one by one to identify the problematic package
1. **Check changelog**: Review the package's changelog for breaking changes
1. **Review test output**: Check specific failure details in test output
1. **Update tests**: Your tests may need updates for new package versions

#### Tool upgrade fails

**Solution**: Some tools may require manual intervention

1. Check tool-specific documentation for upgrade requirements
1. Consider upgrading tools individually if needed
1. Verify tool compatibility with your Python version
1. Check for tool-specific configuration requirements

## Contributing

1. Fork the repository
1. Create a feature branch
1. Make your changes
1. Submit a pull request

## License

MIT License
