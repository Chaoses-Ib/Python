# Wheel
[Python Wheels](https://pythonwheels.com/)

[Wheels](https://pypi.org/project/wheel) are [the new standard](https://www.python.org/dev/peps/pep-0427) of Python distribution and are intended to replace eggs.

Advantages:
1. Faster installation for pure Python and native C extension packages.
2. Avoids arbitrary code execution for installation. (Avoids `setup.py`)
3. Installation of a C extension does not require a compiler on Linux, Windows or macOS.
4. Allows better caching for testing and continuous integration.
5. Creates `.pyc` files as part of installation to ensure they match the Python interpreter used.
6. More consistent installs across platforms and machines.