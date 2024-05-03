# Config
- [configparser: Configuration file parser - Python3 Docs](https://docs.python.org/3/library/configparser.html)
  - Format: INI

- [dynaconf: Configuration Management for Python ⚙](https://github.com/dynaconf/dynaconf)
  - > Dynaconf core has no dependency. It uses vendored copies of external libraries such as python-box, click, python-dotenv, ruamel-yaml, python-toml
  
  - [Settings Files](https://www.dynaconf.com/settings_files/)
    - The default `root_path` is the folder where your entry point python file is located (like `app.py`).
    - Then, it will look at each parent down to the root of the system. For each visited folder, it will also try looking inside a `/config` folder.
    - The default `settings_files` are: `settings.toml`, `.secrets.toml`
    - [How to include config.py within Python package? - dynaconf/dynaconf - Discussion #1056](https://github.com/dynaconf/dynaconf/discussions/1056)
      - `root_path=Path(__file__).resolve().parent`
  
  - Default values
    - [Validation](https://www.dynaconf.com/validation/)
      - `-` is not equal to `_`
    - [Merging](https://www.dynaconf.com/merging/)
      - `*.local.*` (`settings.local.toml`)
    - `update()` will *override* instead of *merge* the values.
  
    [How to initialize settings without settings(.toml) file? - dynaconf/dynaconf - Discussion #1084](https://github.com/dynaconf/dynaconf/discussions/1084)

- [python-dotenv: Reads key-value pairs from a .env file and can set them as environment variables. It helps in developing applications following the 12-factor principles.](https://github.com/theskumar/python-dotenv)

- [Confuse: painless YAML config files for Python](https://github.com/beetbox/confuse)

[Stop hardcoding and start using config files instead, it takes very little effort with configparser : r/Python](https://www.reddit.com/r/Python/comments/my1m66/stop_hardcoding_and_start_using_config_files/)

[What's the standard config file name and extension in Python? - Stack Overflow](https://stackoverflow.com/questions/2850084/whats-the-standard-config-file-name-and-extension-in-python)
- `settings.ini`
- `{applicationName}.config`
- `{applicationName}.cfg`

[What's the best practice using a settings file in Python? - Stack Overflow](https://stackoverflow.com/questions/5055042/whats-the-best-practice-using-a-settings-file-in-python)

[How can I make pip install package data (a config file)? - Stack Overflow](https://stackoverflow.com/questions/58038169/how-can-i-make-pip-install-package-data-a-config-file)