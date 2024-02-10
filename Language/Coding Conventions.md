# Coding Conventions
[PEP 8 -- Style Guide for Python Code | peps.python.org](https://peps.python.org/pep-0008/)

[coding style - Python file naming convention? - Software Engineering Stack Exchange](https://softwareengineering.stackexchange.com/questions/308972/python-file-naming-convention)

[Python project structure: when to use singular, when plural? : softwarearchitecture](https://www.reddit.com/r/softwarearchitecture/comments/yamso3/python_project_structure_when_to_use_singular/)

## Underscores vs dashes
[Analysis of PyPi package names and the use of dashes underscores upper and lower case](https://gist.github.com/gene1wood/9472a9d0dffce1a56d6e796afc6539b8)
```
Total packages : 87680
Packages with dashes : 23370 (26.65%)
Packages with underscores : 7750 (8.84%)
Packages with both dashes and underscores : 133 (0.15%)
Packages with all lowercase characters : 76036 (86.72%)
Packages with all uppercase characters : 439 (0.50%)
Packages with both lower and upper case characters : 11213 (12.79%)
```

[Naming conventions, `_` vs `-`; why does "jupyterlab-mathjax3" use a dash? - JupyterLab - Jupyter Community Forum](https://discourse.jupyter.org/t/naming-conventions-vs-why-does-jupyterlab-mathjax3-use-a-dash/15171)
> There is no typo-squatting danged exactly because PyPI and pip normalises `_` to `-`. Try `pip freeze`: do you see anything with `_`? What is more user-friendly, having consistency with package manager or not? Also, it is a predominant convention to use `-` in PyPI package names.

Hatching's example uses a dash instead of underscore[^hatch].

[^hatch]: [Metadata - Hatch](https://hatch.pypa.io/latest/config/metadata/#name)