# Example App

This is an example application package demonstrating how to structure a Python application within the uv-repo-template workspace.

## Overview

This package serves as a template for creating Python applications. It demonstrates:

- Proper package structure with `src/` layout
- Type safety with `py.typed` files
- Testing conventions with pytest
- Integration with the workspace build system

## Package Structure

```
example-app/
├── src/
│   └── example_app/          # Main package directory
│       ├── __init__.py       # Package initialization
│       ├── py.typed          # Type checking marker
│       ├── main.py           # Application entry point
│       └── main_library.py   # Main library functionality
├── pyproject.toml            # Package configuration
└── README.md                 # This file
```

## Naming Conventions

**Important**: The workspace member name (`example-app`) and Python package name (`example_app`) follow different conventions:

- **Workspace member name**: Uses hyphens (`example-app`)
- **Python package name**: Uses underscores (`example_app`)

This is a standard convention in Python projects.

## Package Files

### Required Files

- **`__init__.py`**: Marks the directory as a Python package. Usually empty for simple packages.
- **`py.typed`**: Empty file that indicates the package supports type checking. Required for type safety.

### Source Code

Place all your application code inside the `src/example_app/` directory. This structure provides:

- Clear separation between source and other files
- Proper package isolation
- Standard Python packaging practices

## Development

### Importing Dependencies

To import from other packages in the workspace, use the Python package name (without `src/`):

```python
# Import from example-lib package
from example_lib.some_library import some_function
from example_lib.another_library import another_function
```

### Testing

Tests follow these conventions:

- **File naming**: Test files end with `_test.py`
- **Location**: Tests are placed in the same directory as the source code
- **Framework**: Uses pytest for testing

Example test structure:

```
src/example_app/
├── main_library.py
└── main_library_test.py
```

### Running Tests

```bash
# Run all tests in this package
uv run pytest

# Run tests with coverage
uv run pytest --cov=example_app

# Run specific test file
uv run pytest src/example_app/main_library_test.py
```

## Building and Distribution

This package uses `uv_build` as the build backend, configured in `pyproject.toml`:

```toml
[build-system]
requires = ["uv_build>=0.8.3,<0.9.0"]
build-backend = "uv_build"
```

### Building the Package

```bash
# Build the package
uv build

# Build and install in development mode
uv pip install -e .
```

## Configuration

The package configuration is defined in `pyproject.toml`:

- **Name**: `example-app`
- **Version**: `0.1.0`
- **Python requirement**: `>=3.13`
- **Dependencies**: Currently empty, add as needed

### Adding Dependencies

```bash
# Add runtime dependency
uv add requests

# Add development dependency
uv add --dev pytest-mock
```

## Best Practices

1. **Type Safety**: Always include `py.typed` files for type checking support
1. **Testing**: Write tests for all new functionality
1. **Imports**: Use absolute imports from the package root
1. **Documentation**: Document public APIs and complex functions
1. **Code Quality**: Use the pre-configured ruff linter and formatter

## Next Steps

1. Replace the example code with your actual application logic
1. Update the package name and description in `pyproject.toml`
1. Add your specific dependencies
1. Write tests for your functionality
1. Update this README with your application-specific information

## Related Documentation

- [Main project README](../README.md) - Overview of the entire workspace
- [Setup documentation](../setup/README.md) - Development environment setup
- [Example library](../example-lib/README.md) - Library package example
