# Modules
[Modules - Python3 Docs](https://docs.python.org/3/tutorial/modules.html)

- Class cannot inherit module
- [Add `__getitem__` to module - Stack Overflow](https://stackoverflow.com/questions/29064125/add-getitem-to-module)

## Packages
A **regular package** is typically implemented as a directory containing an `__init__.py` file. When a regular package is imported, this `__init__.py` file is implicitly executed, and the objects it defines are bound to names in the package's namespace. The `__init__.py` file can contain the same Python code that any other module can contain, and Python will add some additional attributes to the module when it is imported.

A **namespace package** is a composite of various [portions](https://docs.python.org/3/glossary.html#term-portion), where each portion contributes a subpackage to the parent package. Portions may reside in different locations on the file system. Portions may also be found in zip files, on the network, or anywhere else that Python searches during import. Namespace packages may or may not correspond directly to objects on the file system; they may be virtual modules that have no concrete representation.

[Is `__init__.py` not required for packages in Python 3.3+ - Stack Overflow](https://stackoverflow.com/questions/37139786/is-init-py-not-required-for-packages-in-python-3-3)

## [`sys.path`](https://docs.python.org/3/library/sys.html#sys.path)
Only strings should be added to `sys.path`; all other data types are **ignored** during import.
- [bpo-32642: Allow for PathLike objects in sys.path by sroet - Pull Request #22000 - python/cpython](https://github.com/python/cpython/pull/22000)

## Import system
[The import system - Python3 Docs](https://docs.python.org/3/reference/import.html)

[importlib --- The implementation of import - Python3 Docs](https://docs.python.org/3/library/importlib.html#module-importlib.util)

## Visibility
- `_impl` pattern

  `__init__.py`:
  ```python
  from ._impl import *
  ```
  `_impl.py`:
  ```python
  __all__ = [...]
  ```

  [refactor(runtime/util): hide nodes imports to avoid overwhelm the sug... - Chaoses-Ib/ComfyScript@cd2d715](https://github.com/Chaoses-Ib/ComfyScript/commit/cd2d715c596609a0f17bfb81214f68a98dce5aa9)

[python - Hide external modules when importing a module (e.g. regarding code-completion) - Stack Overflow](https://stackoverflow.com/questions/16509012/hide-external-modules-when-importing-a-module-e-g-regarding-code-completion)

## Intra-package references
[Modules - Python3 Docs](https://docs.python.org/3/tutorial/modules.html#intra-package-references)

### Package relative imports
For example, given the following package layout:
```python
package/
    __init__.py
    subpackage1/
        __init__.py
        moduleX.py
        moduleY.py
    subpackage2/
        __init__.py
        moduleZ.py
    moduleA.py
```

In either `subpackage1/moduleX.py` or `subpackage1/__init__.py`, the following are valid relative imports:
```python
from .moduleY import spam
from .moduleY import spam as ham
from . import moduleY
from ..subpackage1 import moduleY
from ..subpackage2.moduleZ import eggs
from ..moduleA import foo
```

[Relative imports in Python 3 - Stack Overflow](https://stackoverflow.com/questions/16981921/relative-imports-in-python-3)

## builtins
[python - Access builtin functions by `__builtins__` - Stack Overflow](https://stackoverflow.com/questions/28050229/access-builtin-functions-by-builtins)

## [`__main__`: Top-level code environment](https://docs.python.org/3/library/__main__.html)
In Python, the special name `__main__` is used for two important constructs:

1. the name of the top-level environment of the program, which can be checked using the `__name__ == '__main__'` expression; and
2. the `__main__.py` file in Python packages.

Both of these mechanisms are related to Python modules; how users interact with them and how they interact with each other.

### Import a module as `__main__`
[How to import a module as `__main__`? - Stack Overflow](https://stackoverflow.com/questions/11160643/how-to-import-a-module-as-main)
- [runpy: Locating and executing Python modules](https://docs.python.org/3/library/runpy.html)

  Can only execute a module but not import it.

- Modifying `module.__name__` and calling `spec.loader.exec_module(module)` doens't work.

  ```python
  spec = importlib.util.find_spec('main')
  main = importlib.util.module_from_spec(spec)
  main.__name__ = '__main__'
  spec.loader.exec_module(main)
  '''
  File <frozen importlib._bootstrap_external>:879, in exec_module(self, module)
  File <frozen importlib._bootstrap_external>:957, in get_code(self, fullname)
  File <frozen importlib._bootstrap_external>:546, in _check_name_wrapper(self, name, *args, **kwargs)
  ImportError: loader for main cannot handle __main__
  '''
  ```

  [python - Injecting variables into an import namespace - Stack Overflow](https://stackoverflow.com/questions/38647348/injecting-variables-into-an-import-namespace)