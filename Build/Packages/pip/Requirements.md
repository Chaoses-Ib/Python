# Requirements
[Requirement Specifiers](https://pip.pypa.io/en/stable/reference/requirement-specifiers/)

## Requirements file
[Requirements File Format](https://pip.pypa.io/en/stable/reference/requirements-file-format/)

Example:
```python
# It is possible to specify requirements as plain names.
pytest
pytest-cov
beautifulsoup4

# The syntax supported here is the same as that of requirement specifiers.
docopt == 0.6.1             # Version Matching. Must be version 0.6.1
keyring >= 4.1.1            # Minimum version 4.1.1
coverage != 3.5             # Version Exclusion. Anything except version 3.5
Mopidy-Dirble ~= 1.1        # Compatible release. Same as >= 1.1, == 1.*
requests [security] >= 2.8.1, == 2.8.* ; python_version < "2.7"
urllib3 @ https://github.com/urllib3/urllib3/archive/refs/tags/1.26.8.zip

# It is possible to refer to other requirement files or constraints files.
-r other-requirements.txt
-c constraints.txt

# It is possible to refer to specific local distribution paths.
./downloads/numpy-1.9.2-cp34-none-win32.whl

# It is possible to refer to URLs.
http://wxpython.org/Phoenix/snapshot-builds/wxPython_Phoenix-3.0.3.dev1820+49a8884-cp34-none-win_amd64.whl
```
Git:
- `git+https://github.com/Chaoses-Ib/ComfyScript.git`
- `comfy-script[default] @ git+https://github.com/Chaoses-Ib/ComfyScript.git`
- `git+https://github.com/Chaoses-Ib/ComfyScript#egg=ComfyScript[default]`

`pip freeze` outputs installed packages in requirements format.

Usage:
```sh
pip3 install -r requirements.txt
```