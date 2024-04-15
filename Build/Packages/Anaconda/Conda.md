# Conda
[Changing the Python Version in Conda - Sparrow Computing](https://sparrow.dev/changing-the-python-version-in-conda/)
- `conda create --name py38 python=3.8 pip`
- ```sh
  conda activate py38
  conda deactivate
  ```

## 代理问题
```sh
SET https_proxy=http://127.0.0.1:1080
```
[python - Why requests raise this exception "check\_hostname requires server\_hostname"? - Stack Overflow](https://stackoverflow.com/questions/66642705/why-requests-raise-this-exception-check-hostname-requires-server-hostname)

## PowerShell
[anaconda - Conda activate not working? - Stack Overflow](https://stackoverflow.com/questions/47246350/conda-activate-not-working)

```sh
conda init powershell
```

## Conda vs pip & venv
[Pip vs Conda: an in-depth comparison of Python's two packaging systems](https://pythonspeed.com/articles/conda-vs-pip/)

conda 包含非 Python 的包，因此跨平台维护更加方便。

## Update
conda 不能通过安装包升级（不允许覆盖文件夹），但可以通过 conda 自己更新自己：

更新 conda：`conda update conda`

更新 Python：`conda update python`

更新全部：`conda update --all`