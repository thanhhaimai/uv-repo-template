# Example App

This is an example application package demonstrating how to structure a Python application within the uv-repo-template workspace.

## Overview

This package serves as a template for creating Python applications.
It demonstrates:

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

**Important**: The workspace member name (`example-app`)
and Python package name (`example_app`) follow different conventions:

- **Workspace member name**: Uses hyphens (`example-app`)
- **Python package name**: Uses underscores (`example_app`)

This is a standard convention in Python projects.

## Package Files

### Required Files

- **`__init__.py`**: Marks the directory as a Python package.
  Typically empty for simple packages.
- **`py.typed`**: Empty file that indicates the package supports type checking.
  Required for type safety.

### Source Code

Place all your application code inside the `src/example_app/` directory.
This structure provides:

- Clear separation between source and other files
- Proper package isolation
- Standard Python packaging practices

## Development

### Importing Dependencies

To import from other packages in the workspace,
use the Python package name (without `src/`):

```python
# Import from example-lib package
from example_lib.some_library import some_function
from example_lib.another_library import another_function
```

Prefer absolute imports for clarity.

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

### Adding Dependencies

```bash
# Add runtime dependency
uv add requests

# Add development dependency
uv add --dev pytest-mock
```

## Related Documentation

- [Main project README](../README.md) - Overview of the entire workspace
- [Setup documentation](../setup/README.md) - Development environment setup
- [Example application](../example-lib/README.md) - Library package example
