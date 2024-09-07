# Package Management
[Python Packaging Authority --- PyPA documentation](https://www.pypa.io/en/latest/) ([GitHub](https://github.com/pypa))

[Python Packaging User Guide](https://packaging.python.org/)

![](https://packaging.python.org/en/latest/_images/py_pkg_tools_and_libs.png)

[pypackaging-native](https://pypackaging-native.github.io/)

[Virtual Environments and Packages - Python3 Docs](https://docs.python.org/3/tutorial/venv.html)

[Python包管理：pip、easy_install、eggs和wheel - 香象过河的博客](https://blog.csdn.net/u010458170/article/details/46438763)
- easy_install → pip
- setuptools → distribute → setuptools
  - Egg
- [Wheel](Wheel/README.md)

[packaging: Core utilities for Python packages](https://github.com/pypa/packaging)

## src layout vs flat layout
[src layout vs flat layout - Python Packaging User Guide](https://packaging.python.org/en/latest/discussions/src-layout-vs-flat-layout/)
  
[How is the module directory name (src) being specified? - Issue #615 - pypa/packaging-problems](https://github.com/pypa/packaging-problems/issues/615)

[Testing & Packaging](https://hynek.me/articles/testing-packaging/)

[Stance (or discussion) on src/ directory - Issue #320 - pypa/packaging.python.org](https://github.com/pypa/packaging.python.org/issues/320)

Pyright will try to resolute the import from both the root directory and the `src` directory.[^pyright]


[^pyright]: [pyright/docs/import-resolution.md at main - microsoft/pyright](https://github.com/microsoft/pyright/blob/main/docs/import-resolution.md#resolution-order)

## `pyproject.toml`
### Project metadata
[PEP 621 -- Storing project metadata in pyproject.toml | peps.python.org](https://peps.python.org/pep-0621/)

Two fields are required: `name` and `version`.

[importlib.metadata -- Accessing package metadata - Python 3.11 Docs](https://docs.python.org/3.11/library/importlib.metadata.html)
- Entry points

### Version
[Version specifiers - Python Packaging User Guide](https://packaging.python.org/en/latest/specifications/version-specifiers/)
- `[N!]N(.N)*[{a|b|rc}N][.postN][.devN]`
  - `^([1-9][0-9]*!)?(0|[1-9][0-9]*)(\.(0|[1-9][0-9]*))*((a|b|rc)(0|[1-9][0-9]*))?(\.post(0|[1-9][0-9]*))?(\.dev(0|[1-9][0-9]*))?$`
- Epoch segment
- Release segment
- Pre-release segment

  Pre-release separators:
  > Pre-releases should allow a `.`, `-`, or `_` separator between the release segment and the pre-release segment. The normal form for this is without a separator. This allows versions such as `1.1.a1` or `1.1-a1` which would be normalized to `1.1a1`. It should also allow a separator to be used between the pre-release signifier and the numeral. This allows versions such as `1.0a.1` which would be normalized to `1.0a1`.

  Pre-release spelling:
  > Pre-releases allow the additional spellings of `alpha`, `beta`, `c`, `pre`, and `preview` for `a`, `b`, `rc`, `rc`, and `rc` respectively. This allows versions such as `1.1alpha1`, `1.1beta2`, or `1.1c3` which normalize to `1.1a1`, `1.1b2`, and `1.1rc3`. In every case the additional spelling should be considered equivalent to their normal forms.

  Implicit pre-release number:
  > Pre releases allow omitting the numeral in which case it is implicitly assumed to be `0`. The normal form for this is to include the `0` explicitly. This allows versions such as `1.2a` which is normalized to `1.2a0`.

  [CPython](https://www.python.org/downloads/release/python-3120a1/) and most packages start pre-release numbers at 1 instead of 0.

- Post-release segment
- Development release segment

#### URLs
[Document recommended keys for `project_urls` - Issue #5947 - pypi/warehouse](https://github.com/pypi/warehouse/issues/5947)
- [Investigation into "canonical" link for a PyPI repo link - Issue #11 - hugovk/pypi-tools](https://github.com/hugovk/pypi-tools/issues/11)

[PyPI Project URLs Cheatsheet](https://daniel.feldroy.com/posts/2023-08-pypi-project-urls-cheatsheet)

### Dependencies
[PEP 735 -- Dependency Groups in pyproject.toml | peps.python.org](https://peps.python.org/pep-0735/)

[Add ability to specify "default" extras\_require - Issue #1139 - pypa/setuptools](https://github.com/pypa/setuptools/issues/1139)

[pip - How to package a Python module with extras as default? - Stack Overflow](https://stackoverflow.com/questions/60842775/how-to-package-a-python-module-with-extras-as-default)
- [Support the empty-string extra by di - Pull Request #1503 - pypa/setuptools](https://github.com/pypa/setuptools/pull/1503)

What will happen if a package is installed with extras, but no extras when upgrading?

[Specify `extras_require` with `pip install -e` - Stack Overflow](https://stackoverflow.com/questions/30239152/specify-extras-require-with-pip-install-e)
- `pip install -e ".[extra]"`

## Resources
[Easy and recommended way to get path of datafile within package? - Python Help - Discussions on Python.org](https://discuss.python.org/t/easy-and-recommended-way-to-get-path-of-datafile-within-package/20581)

[Find path of module without importing in Python - Stack Overflow](https://stackoverflow.com/questions/4693608/find-path-of-module-without-importing-in-python)

### `importlib.resources`
[importlib.resources -- Package resource reading, opening and access - Python 3.11 Docs](https://docs.python.org/3.11/library/importlib.resources.html)

### `pkg_resources` (deprecated)
[Package Discovery and Resource Access using `pkg_resources` - setuptools 69.0.3.post20240124 documentation](https://setuptools.pypa.io/en/latest/pkg_resources.html)

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

## Local installs
[Local project installs - pip documentation](https://pip.pypa.io/en/stable/topics/local-project-installs/)

Certain build backends (eg: `setuptools`) will litter the project directory with secondary build artifacts (eg: `.egg-info`, `build` and `dist` directories).
- [Installing, Building a package - generates unnecessary files? .egg-info/ build/ - Issue #4198 - pypa/setuptools](https://github.com/pypa/setuptools/issues/4198)
- [setup.py leaves build, dist, .egg-info etc + even clean doesn't remove them - Issue #1347 - pypa/setuptools](https://github.com/pypa/setuptools/issues/1347)
- [\[FR\] Automatically clean-up egg-info left in directory on isolated builds - Issue #3573 - pypa/setuptools](https://github.com/pypa/setuptools/issues/3573)
- [Change .egg-info directory with pip install --editable - Stack Overflow](https://stackoverflow.com/questions/54260307/change-egg-info-directory-with-pip-install-editable)

  `egg_base`:
  ```toml
  [tool.distutils.egg_info]
  egg_base = "target"
  ```
- [Incorrect permissions on \*.egg-info directory - Issue #1328 - pypa/setuptools](https://github.com/pypa/setuptools/issues/1328)

[PEP 3147 -- PYC Repository Directories | peps.python.org](https://peps.python.org/pep-3147/)
- `PYTHONDONTWRITEBYTECODE=1`

  > There’s no in-memory .pyc file, but there is the in-memory compiled code.

  [Cpython behavior regarding pycache folder on read-only volume - Python Help - Discussions on Python.org](https://discuss.python.org/t/cpython-behavior-regarding-pycache-folder-on-read-only-volume/30992)

  [large memory overhead when pyc is recompiled - Issue #68273 - python/cpython](https://github.com/python/cpython/issues/68273)

- `PYTHONPYCACHEPREFIX`

  [python - Changing the directory where .pyc files are created - Stack Overflow](https://stackoverflow.com/questions/3522079/changing-the-directory-where-pyc-files-are-created)

## Editable installs
[Development Mode (a.k.a. "Editable Installs") - setuptools documentation](https://setuptools.pypa.io/en/latest/userguide/development_mode.html)

[How to install a package using pip in editable mode with pyproject.toml? - Stack Overflow](https://stackoverflow.com/questions/69711606/how-to-install-a-package-using-pip-in-editable-mode-with-pyproject-toml)

> ERROR: File "setup.py" or "setup.cfg" not found. Directory cannot be installed in editable mode: C:\example
(A "pyproject.toml" file was found, but editable mode currently requires a setuptools-based build.)

```sh
python -m pip install --upgrade pip
```

## Entry points
[Entry points specification - Python Packaging User Guide](https://packaging.python.org/en/latest/specifications/entry-points/)

[Entry Points - setuptools documentation](https://setuptools.pypa.io/en/latest/userguide/entry_point.html)

[importlib.metadata -- Accessing package metadata - Python 3.11 Docs](https://docs.python.org/3.11/library/importlib.metadata.html)
- Can get package path by `importlib.util.find_spec(entry_point.module).origin` (or `submodule_search_locations[0]`)
- [Get entry point script file location in setuputils package? - Stack Overflow](https://stackoverflow.com/questions/25066084/get-entry-point-script-file-location-in-setuputils-package)

## [PyPI](https://pypi.org/)
- Packages cannot have direct dependencies

  [November 29, 2022 - PyPI Doesn't Allow Git Repo Dependencies | David Chan - Today I Learned (TIL)](https://til.dchan.cc/posts/11-29-2022/)

[TestPyPI - The Python Package Index](https://test.pypi.org/)
- Hatch: `hatch publish -r test`