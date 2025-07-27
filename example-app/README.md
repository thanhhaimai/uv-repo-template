# An example app

## Source Tree

All source should be put inside `src/<package_name>` folder.

NOTE: the workspace member name (`example-app` in this case) and package name (`example_app` in this case) is not necessary the same. The convention for workspace member name uses `-`. For Python package name uses `_`.

`__init__.py` is required to explicitly signal that the directory should be treated as a package. For most typical cases, it should be empty. For advance use cases, please refer to Python documentation.

`py.typed` (empty) is required for every package (same location with `__init__.py`). This indicates that the package should be checked for type correctness.

## Import a package

To import another package simply use the python package name (without `src`)

Example (also in `main_library.py`)

```python
from example_lib.some_library import some_function
```

## Write tests

All files with `_test.py` suffix are `pytest` files. The convention is to put the test in the same folder with the source.
