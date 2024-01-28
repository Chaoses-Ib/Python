# Package Management
[Python Packaging Authority --- PyPA documentation](https://www.pypa.io/en/latest/) ([GitHub](https://github.com/pypa))

[Python Packaging User Guide](https://packaging.python.org/)

![](https://packaging.python.org/en/latest/_images/py_pkg_tools_and_libs.png)

[Virtual Environments and Packages - Python3 Docs](https://docs.python.org/3/tutorial/venv.html)

[Python包管理：pip、easy_install、eggs和wheel - 香象过河的博客](https://blog.csdn.net/u010458170/article/details/46438763)
- easy_install → pip
- setuptools → distribute → setuptools
  - Egg
- [Wheel](Wheel/README.md)

## src layout vs flat layout
[src layout vs flat layout - Python Packaging User Guide](https://packaging.python.org/en/latest/discussions/src-layout-vs-flat-layout/)
  
[How is the module directory name (src) being specified? - Issue #615 - pypa/packaging-problems](https://github.com/pypa/packaging-problems/issues/615)

[Testing & Packaging](https://hynek.me/articles/testing-packaging/)

[Stance (or discussion) on src/ directory - Issue #320 - pypa/packaging.python.org](https://github.com/pypa/packaging.python.org/issues/320)

Pyright will try to resolute the import from both the root directory and the `src` directory.[^pyright]


[^pyright]: [pyright/docs/import-resolution.md at main - microsoft/pyright](https://github.com/microsoft/pyright/blob/main/docs/import-resolution.md#resolution-order)

## `pyproject.toml`
### Dependencies
[PEP 735 -- Dependency Groups in pyproject.toml | peps.python.org](https://peps.python.org/pep-0735/)

[Add ability to specify "default" extras\_require - Issue #1139 - pypa/setuptools](https://github.com/pypa/setuptools/issues/1139)

[pip - How to package a Python module with extras as default? - Stack Overflow](https://stackoverflow.com/questions/60842775/how-to-package-a-python-module-with-extras-as-default)
- [Support the empty-string extra by di - Pull Request #1503 - pypa/setuptools](https://github.com/pypa/setuptools/pull/1503)

## Backends
[The Basics of Python Packaging in Early 2023 - DrivenData Labs](https://drivendata.co/blog/python-packaging-2023)

- [Hatchling](Hatch/README.md#hatchling)

- [PDM](https://github.com/pdm-project/pdm)

- [Poetry Core](https://github.com/python-poetry/poetry-core)

  [Support for PEP 621 - Issue #3 - python-poetry/roadmap](https://github.com/python-poetry/roadmap/issues/3)

- [Flit](https://github.com/pypa/flit)

- [setuptools](https://github.com/pypa/setuptools)

  > Setuptools has too many legacy options, and too much out of date information on the web, to make it a good choice for a beginner.

> Poetry, PDM and hatch are too closely tied to their respective workflow tools, making a backend recommendation feel like a workflow tool recommendation (which we definitely shouldn’t be making)

[Discuss how to update the "Tool recommendations" page - Issue #1468 - pypa/packaging.python.org](https://github.com/pypa/packaging.python.org/issues/1468)

## Frontends
[Python Packaging Tools --- Python Packaging Guide](https://www.pyopensci.org/python-package-guide/package-structure-code/python-package-build-tools.html)

![](https://www.pyopensci.org/python-package-guide/_images/python-package-tools-decision-tree.png)

[Pipenv, pip-tools, PDM, or Poetry? : Python](https://www.reddit.com/r/Python/comments/16qz8mx/pipenv_piptools_pdm_or_poetry/)

## Editable installs
[Development Mode (a.k.a. "Editable Installs") - setuptools documentation](https://setuptools.pypa.io/en/latest/userguide/development_mode.html)

> ERROR: File "setup.py" or "setup.cfg" not found. Directory cannot be installed in editable mode: C:\example
(A "pyproject.toml" file was found, but editable mode currently requires a setuptools-based build.)

```sh
python -m pip install --upgrade pip
```

## Entry points
[Entry points specification - Python Packaging User Guide](https://packaging.python.org/en/latest/specifications/entry-points/)

[Entry Points - setuptools documentation](https://setuptools.pypa.io/en/latest/userguide/entry_point.html)

## [PyPI](https://pypi.org/)
[TestPyPI - The Python Package Index](https://test.pypi.org/)
- Hatch: `hatch publish -r test`