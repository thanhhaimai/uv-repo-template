# Example Library

This is an example library package demonstrating how to structure a Python library within the uv-repo-template workspace.

## Overview

This package serves as a template for creating Python libraries. It demonstrates:

- Proper package structure with `src/` layout
- Type safety with `py.typed` files
- Testing conventions with pytest
- Library-specific best practices
- Integration with the workspace build system

## Package Structure

```
example-lib/
├── src/
│   └── example_lib/          # Main package directory
│       ├── __init__.py       # Package initialization
│       ├── py.typed          # Type checking marker
│       ├── some_library.py   # Example library module
│       ├── some_library_test.py  # Tests for some_library
│       ├── another_library.py    # Another example module
│       └── another_library_test.py # Tests for another_library
├── pyproject.toml            # Package configuration
└── README.md                 # This file
```

## Naming Conventions

**Important**: The workspace member name (`example-lib`) and Python package name (`example_lib`) follow different conventions:

- **Workspace member name**: Uses hyphens (`example-lib`)
- **Python package name**: Uses underscores (`example_lib`)

This is a standard convention in Python projects.

## Package Files

### Required Files

- **`__init__.py`**: Marks the directory as a Python package. Usually empty for simple packages.
- **`py.typed`**: Empty file that indicates the package supports type checking. Required for type safety.

### Source Code

Place all your library code inside the `src/example_lib/` directory. This structure provides:

- Clear separation between source and other files
- Proper package isolation
- Standard Python packaging practices

## Development

### Internal Package Imports

To import from other modules within the same library, use the Python package name (without `src/`):

```python
# Import from another module in the same library
from example_lib.some_library import some_function
```

### Testing

Tests follow these conventions:

- **File naming**: Test files end with `_test.py`
- **Location**: Tests are placed in the same directory as the source code
- **Framework**: Uses pytest for testing

Example test structure:

```
src/example_lib/
├── some_library.py
├── some_library_test.py
├── another_library.py
└── another_library_test.py
```

### Running Tests

```bash
# Run all tests in this package
uv run pytest

# Run tests with coverage
uv run pytest --cov=example_lib

# Run specific test file
uv run pytest src/example_lib/some_library_test.py
```

## Library Design Principles

### API Design

When designing your library API:

1. **Clear interfaces**: Define clear, well-documented public APIs
1. **Type hints**: Use type hints for all public functions and classes
1. **Documentation**: Include docstrings for all public functions
1. **Error handling**: Provide meaningful error messages and exceptions

### Example Library Module

```python
"""Example library module demonstrating best practices."""

from typing import List, Optional


def some_function(input_data: str) -> List[str]:
    """
    Process input data and return a list of results.
    
    Args:
        input_data: The input string to process
        
    Returns:
        A list of processed strings
        
    Raises:
        ValueError: If input_data is empty
    """
    if not input_data:
        raise ValueError("input_data cannot be empty")
    
    return [input_data.upper(), input_data.lower()]


class ExampleClass:
    """Example class demonstrating library design patterns."""
    
    def __init__(self, name: str, value: Optional[int] = None):
        self.name = name
        self.value = value or 0
    
    def process(self) -> str:
        """Process the instance data."""
        return f"{self.name}: {self.value}"
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

- **Name**: `example-lib`
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

## Best Practices for Libraries

1. **Type Safety**: Always include `py.typed` files for type checking support
1. **Testing**: Write comprehensive tests for all public APIs
1. **Documentation**: Provide clear docstrings and examples
1. **Versioning**: Follow semantic versioning principles
1. **Backward Compatibility**: Maintain backward compatibility when possible
1. **Error Handling**: Provide meaningful error messages
1. **Performance**: Consider performance implications of your APIs

## Publishing

When ready to publish your library:

1. **Update version**: Increment version in `pyproject.toml`
1. **Update documentation**: Ensure README and docstrings are current
1. **Run tests**: Ensure all tests pass
1. **Build package**: `uv build`
1. **Publish**: Use your preferred publishing method (PyPI, private registry, etc.)

## Next Steps

1. Replace the example code with your actual library functionality
1. Update the package name and description in `pyproject.toml`
1. Add your specific dependencies
1. Write comprehensive tests for your APIs
1. Update this README with your library-specific information
1. Consider adding API documentation (e.g., with Sphinx)

## Related Documentation

- [Main project README](../README.md) - Overview of the entire workspace
- [Setup documentation](../setup/README.md) - Development environment setup
- [Example application](../example-app/README.md) - Application package example
