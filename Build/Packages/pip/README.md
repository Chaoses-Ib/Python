# pip
[pip documentation](https://pip.pypa.io/en/stable/)

[Installation - pip documentation](https://pip.pypa.io/en/stable/installation/)
- Built-in

- `ensurepip`
  - Used by `venv`.
  - Cannot be used without environment variable `SystemRoot`.

    [python - Error when creating venv, Error: Command '-Im', 'ensurepip', '--upgrade', '--default-pip'\]' returned non-zero exit status 1 - Stack Overflow](https://stackoverflow.com/questions/69594088/error-when-creating-venv-error-command-im-ensurepip-upgrade-def)

- `get-pip.py`

  > You may be wondering what this giant blob of binary data here is, you might even be worried that we're up to something nefarious (good for you for being paranoid!). This is a base85 encoding of a zip file, this zip file contains an entire copy of pip (version 24.1.2).

  - `min_version = (3, 8)`

[in python How to get rid of dist files when pip installing with --target --upgrade? - Stack Overflow](https://stackoverflow.com/questions/70289303/in-python-how-to-get-rid-of-dist-files-when-pip-installing-with-target-upgra)

## API
[Using pip from your program](https://pip.pypa.io/en/latest/user_guide/#using-pip-from-your-program)

> pip is a command line program. While it is implemented in Python, and so is available from your Python code via `import pip`, you must not use pip’s internal APIs in this way. There are a number of reasons for this:
> 1. The pip code assumes that it is in sole control of the global state of the program. pip manages things like the logging system configuration, or the values of the standard IO streams, without considering the possibility that user code might be affected.
> 2. pip's code is *not* thread safe. If you were to run pip in a thread, there is no guarantee that either your code or pip's would work as you expect.
> 3. pip assumes that once it has finished its work, the process will terminate. It doesn't need to handle the possibility that other code will continue to run after that point, so (for example) calling pip twice in the same process is likely to have issues.

[pip-api: An unofficial, importable pip API](https://github.com/di/pip-api)