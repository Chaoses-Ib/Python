# Deployment
[Python Packaging User Guide](https://packaging.python.org/)

![](https://packaging.python.org/en/latest/_images/py_pkg_applications.png)

[^v2ex]
- [PyInstaller](PyInstaller/README.md)
- [PyOxidizer](PyOxidizer.md)

  PyOxidizer often skips extracting files and loads modules directly from memory using zero-copy. This makes PyOxidizer executables significantly faster to start when this feature is employed.

  - [Python Standalone Builds: Produce redistributable builds of Python](https://github.com/indygreg/python-build-standalone)
    - `pip`, `venv` included

      [Windows archive is missing ensurepip, venv, tests and tk - Issue #19 - indygreg/python-build-standalone](https://github.com/indygreg/python-build-standalone/issues/19)

    - `install_only` includes `include`, `libs`, Tcl/tk and PDB
  
    - Affected by `PYTHONHOME`, `PYTHONPATH`
  
      [removing PYTHONHOME dependency from a static libpython? - Issue #57 - indygreg/python-build-standalone](https://github.com/indygreg/python-build-standalone/issues/57)
  
  - [The PyOxy Python Runner](https://pyoxidizer.readthedocs.io/en/latest/pyoxy.html)

[^v2ex]: [Python 现代化打包应用到 exe 的方式？ - V2EX](https://www.v2ex.com/t/859122)

## [→Embedding](../Implementations/CPython/README.md#embedding)

## Windows
[Using Python on Windows - Python3 Docs](https://docs.python.org/3/using/windows.html)
- [The full installer](https://docs.python.org/3/using/windows.html#windows-full)

- [The Microsoft Store package](https://docs.python.org/3/using/windows.html#windows-store)

- [The nuget.org packages](https://docs.python.org/3/using/windows.html#windows-nuget)

  CI/CD

  [NuGet Gallery | python 3.12.4](https://www.nuget.org/packages/python)
  - MSBuild props
  - `include`, `libs`
  - pip

- [The embeddable package](https://docs.python.org/3/using/windows.html#windows-embeddable)
  - Tcl/tk (including all dependents, such as Idle), pip and the Python documentation are not included.

    No `ensurepip` either. 需要通过 [`get-pip.py`](../Packages/pip/README.md) 安装 pip，并进行一些修改来支持 site packages。

    [pip with embedded python - Stack Overflow](https://stackoverflow.com/questions/42666121/pip-with-embedded-python)
  
  - No `venv`. 即使通过 pip 安装也无法正常工作。不过 embedded package 本身也是隔离的，只是调用时不需要像 venv 一样激活。

    > The embedded package is similar to a Python Virtual Environment but technically is not. It does not require an *activate* script to set environment variable `VIRTUAL_ENV` or modify the `PATH`. It will run isolated without environment modifications.

    [venv or virtualenv with embedded python - Stack Overflow](https://stackoverflow.com/questions/70008011/venv-or-virtualenv-with-embedded-python)

  - Not affected by `PYTHONHOME`, `PYTHONPATH`

  - The embedded distribution does not include the [Microsoft C Runtime](https://docs.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist#visual-studio-2015-2017-2019-and-2022) and it is the responsibility of the application installer to provide this.
  
  - 21 MiB, 10.5 MiB compressed

  [PythonEmbed4Win: Quickly setup a portable python environment for Windows.](https://github.com/jtmoon79/PythonEmbed4Win)
  - [fully configuring embedded Python on Windows 10](https://gist.github.com/jtmoon79/ce63fe655b2f544462e70d8e5ec30ff5)

  Used by:
  - [ComfyUI](https://github.com/comfyanonymous/ComfyUI/blob/master/.github/workflows/windows_release_package.yml): repackaged with `get-pip.py` applied, dependencies installed
  - [sd-webui](https://github.com/AUTOMATIC1111/stable-diffusion-webui/releases/tag/v1.0.0-pre): repackaged with `get-pip.py` file, `venv` skipped

[Python Releases for Windows | Python.org](https://www.python.org/downloads/windows/)

## macOS
[Using Python on a Mac - Python3 Docs](https://docs.python.org/3/using/mac.html)