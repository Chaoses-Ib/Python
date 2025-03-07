# Environments
- [Environment variables](#environment-variables)
- [`pyvenv.cfg` (virtual environments)](#virtual-environments)

[Interpreter independent isolated/virtual environments - Packaging - Discussions on Python.org](https://discuss.python.org/t/interpreter-independent-isolated-virtual-environments/5378)

[sysconfig: Provide access to Python's configuration information - Python3 Docs](https://docs.python.org/3/library/sysconfig.html)

## [Environment variables](https://docs.python.org/3/using/cmdline.html#environment-variables)
- `PYTHONHOME`
- `PYTHONPATH`

All start with `PYTHON`.

## Virtual environments
[PEP 405 -- Python Virtual Environments | peps.python.org](https://peps.python.org/pep-0405/)
- `pyvenv.cfg`

### venv
[venv: Creation of virtual environments - Python3 Docs](https://docs.python.org/3/library/venv.html)
- Not considered as movable or copyable – you just recreate the same environment in the target location.

[Virtual Environments and Packages - Python3 Docs](https://docs.python.org/3/tutorial/venv.html)

`python3 -m venv my-env`
- If `--without-pip` is used, there will be no pip even with `--system-site-packages`.

  [`ensurepip`](Packages/pip/README.md) will still be called even with `--system-site-packages` and pip installed.

  [How to get "python -m venv" to directly install latest pip version - Stack Overflow](https://stackoverflow.com/questions/51720909/how-to-get-python-m-venv-to-directly-install-latest-pip-version)

### Activating
1. Set `VIRTUAL_ENV` to `__VENV_DIR__`

   > Since explicitly activating a virtual environment is not required to use it, `VIRTUAL_ENV` cannot be relied upon to determine whether a virtual environment is being used.

2. Remove `PYTHONHOME`
   
   `PYTHONHOME` defaults to `prefix/lib/pythonversion` and `exec_prefix/lib/pythonversion`. `site.py` will set `base_prefix` to the value of `home` of `pyvenv.cfg` in the parent directory, and `prefix` to the parent directory.

3. Prepend `%VIRTUAL_ENV%\__VENV_BIN_NAME__` to `PATH`

[unix - How does Python find the value for sys.prefix (resp. sys.base\_prefix)? - Stack Overflow](https://stackoverflow.com/questions/64247900/how-does-python-find-the-value-for-sys-prefix-resp-sys-base-prefix)

[Activate a virtualenv with a Python script - Stack Overflow](https://stackoverflow.com/questions/6943208/activate-a-virtualenv-with-a-python-script)
- [activate-virtualenv: Context manager to activate and deactivate Python virtualenvs programatically](https://github.com/usernein/activate-virtualenv)

```rust
/// Returns the path to the `python` executable inside a virtual environment.
fn detect_python_executable(venv: impl AsRef<Path>) -> PathBuf {
    let venv = venv.as_ref();
    if cfg!(windows) {
        // Search for `python.exe` in the `Scripts` directory.
        let executable = venv.join("Scripts").join("python.exe");
        if executable.exists() {
            return executable;
        }

        // Apparently, Python installed via msys2 on Windows _might_ produce a POSIX-like layout.
        // See: https://github.com/PyO3/maturin/issues/1108
        let executable = venv.join("bin").join("python.exe");
        if executable.exists() {
            return executable;
        }

        // Fallback for Conda environments.
        venv.join("python.exe")
    } else {
        // Search for `python` in the `bin` directory.
        venv.join("bin").join("python")
    }
}
```

### VS Code
[virtualenv - Jupyter notebooks in Visual Studio Code does not use the active virtual environment - Stack Overflow](https://stackoverflow.com/questions/58119823/jupyter-notebooks-in-visual-studio-code-does-not-use-the-active-virtual-environm)
