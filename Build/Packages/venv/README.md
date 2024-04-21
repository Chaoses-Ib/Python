# venv
[venv: Creation of virtual environments - Python3 Docs](https://docs.python.org/3/library/venv.html)

[Virtual Environments and Packages - Python3 Docs](https://docs.python.org/3/tutorial/venv.html)

`python3 -m venv my-env`

## Activate
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

## Ubuntu
[New Python Versions : "deadsnakes" team](https://launchpad.net/~deadsnakes/+archive/ubuntu/ppa)

[deadsnakes/issues: Issues for https://launchpad.net/~deadsnakes/+archive/ubuntu/ppa](https://github.com/deadsnakes/issues)
```sh
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install libpython3.6
```