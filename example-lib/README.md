# Example Library

This is an example library package demonstrating how to structure a Python library within the uv-repo-template workspace.

## Overview

This package serves as a template for creating Python libraries.
It demonstrates:

- Proper package structure with `src/` layout
- Type safety with `py.typed` files
- Testing conventions with pytest
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

**Important**: The workspace member name (`example-lib`)
and Python package name (`example_lib`) follow different conventions:

- **Workspace member name**: Uses hyphens (`example-lib`)
- **Python package name**: Uses underscores (`example_lib`)

This is a standard convention in Python projects.

## Package Files

### Required Files

- **`__init__.py`**: Marks the directory as a Python package.
  Typically empty for simple packages.
- **`py.typed`**: Empty file that indicates the package supports type checking.
  Required for type safety.

### Source Code

Place all your library code inside the `src/example_lib/` directory.
This structure provides:

- Clear separation between source and other files
- Proper package isolation
- Standard Python packaging practices

## Development

### Internal Package Imports

To import from other modules within the same library,
use the Python package name (without `src/`):

```python
# Import from another module in the same library
from example_lib.some_library import some_function
```

Prefer absolute imports for clarity.

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
- [Example application](../example-app/README.md) - Application package example
