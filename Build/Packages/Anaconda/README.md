# Anaconda
[Anaconda (Python distribution) - Wikipedia](https://en.wikipedia.org/wiki/Anaconda_(Python_distribution))

[How is Anaconda related to Python? - Stack Overflow](https://stackoverflow.com/questions/42096280/how-is-anaconda-related-to-python)

[Why Use Anaconda? : Python](https://www.reddit.com/r/Python/comments/betkoj/why_use_anaconda/)

[python - What is the difference between pip and conda? - Stack Overflow](https://stackoverflow.com/questions/20994716/what-is-the-difference-between-pip-and-conda)
- Pip installs Python packages whereas conda installs packages which may contain software written in any language.

[Anaconda | Individual Edition](https://www.anaconda.com/products/individual)

[Anaconda Navigator --- Anaconda documentation](https://docs.anaconda.com/anaconda/navigator/)

[Miniconda --- Conda documentation](https://docs.conda.io/en/latest/miniconda.html)

[python - Anaconda vs. miniconda - Stack Overflow](https://stackoverflow.com/questions/45421163/anaconda-vs-miniconda)
- Anaconda installer = Miniconda installer + `conda install anaconda`

Python 的安装包只有 27M，而 Anaconda 的安装包有 457M，安装后要占用 3G……

Miniconda 只有 58M。

[Anaconda | Installation Success](https://www.anaconda.com/products/individual/installation-success?source=win_installer)

## 环境变量问题
![](images/README/PATH.png)

话是这么说，可 VSC 不会啊。

## InvalidArchiveError 问题
1. 挂梯子也没用

   repo.anaconda.com

2. `conda clean -a`

   没用

3. pip

   Could not fetch URL

4. 居然开管理员权限就好了

   哦，是因为我安装在了 `C:\ProgramData` ？那我tm直接放权。

   [anaconda创建新的环境时出现InvalidArchiveError | 码农家园](https://www.codenong.com/cs106839106/)

## Jupyter 问题
- [x] ipykernel
- [ ] traitlets

  ```
  Kernel died with exit code 1073741845. C:\ProgramData\Miniconda3\lib\site-packages\traitlets\traitlets.py:2196: FutureWarning: Supporting extra quotes around Unicode is deprecated in traitlets 5.0. Use 'hmac-sha256' instead of '"hmac-sha256"' – or use CUnicode. warn( C:\ProgramData\Miniconda3\lib\site-packages\traitlets\traitlets.py:2151: FutureWarning: Supporting extra quotes around Bytes is deprecated in traitlets 5.0. Use 'e2ee9fdf-177c-41d3-bad1-27d79d45d08b' instead of 'b"e2ee9fdf-177c-41d3-bad1-27d79d45d08b"'. warn( Bad file descriptor (C:\ci\zeromq_1602704446950\work\src\epoll.cpp:100)
  ```
  - [ ] C:\ProgramData\Miniconda3\Lib\site-packages\traitlets\traitlets.py
    ```sh
    Kernel died with exit code 1073741845. Bad file descriptor (C:\ci\zeromq_1602704446950\work\src\epoll.cpp:100)
    ```
  - [ ] [python - Kernel died with exit code 1(VS code) - Stack Overflow](https://stackoverflow.com/questions/67036168/kernel-died-with-exit-code-1vs-code)

    [Unable to start Kernel ENOTDIR error - Issue #5093 - microsoft/vscode-jupyter](https://github.com/Microsoft/vscode-jupyter/issues/5093)

## Jupyter Notebook 问题
### conda
`conda install jupyter`

[Installing Jupyter Notebook --- Jupyter Documentation 4.1.1 alpha documentation](https://test-jupyter.readthedocs.io/en/latest/install.html)

### jupyter
```
Bad file descriptor (C:\ci\zeromq_1602704446950\work\src\epoll.cpp:100)
Bad file descriptor (C:\ci\zeromq_1602704446950\work\src\epoll.cpp:100)
```
`pip install --upgrade --force-reinstall --no-cache-dir jupyter`

[Error "bad file descriptor" - Issue #5919 - jupyter/notebook](https://github.com/jupyter/notebook/issues/5919)

### pip 域名证书问题
```
Could not fetch URL https://pypi.org/simple/jupyter/: There was a problem confirming the ssl certificate: HTTPSConnectionPool(host='pypi.org', port=443): Max retries exceeded with url: /simple/jupyter/ (Caused by SSLError(SSLEOFError(8, 'EOF occurred in violation of protocol (_ssl.c:1123)'))) - skipping
ERROR: Could not find a version that satisfies the requirement jupyter
ERROR: No matching distribution found for jupyter
Could not fetch URL https://pypi.org/simple/pip/: There was a problem confirming the ssl certificate: HTTPSConnectionPool(host='pypi.org', port=443): Max retries exceeded with url: /simple/pip/ (Caused by SSLError(SSLEOFError(8, 'EOF occurred in violation of protocol (_ssl.c:1123)'))) - skipping
```
- [ ] `pip install --upgrade pip --trusted-host pypi.org`

[Python 3.7- SSL certificate error when excuting pip install Jupyter on command prompt - Stack Overflow](https://stackoverflow.com/questions/59156116/python-3-7-ssl-certificate-error-when-excuting-pip-install-jupyter-on-command-p)

[pip安装库报错：WARNING: Retrying (Retry(total=4, connect=None, read=None, redirect=None, status=None))\_Malidong的博客 - CSDN博客](https://blog.csdn.net/qq_41684249/article/details/110505807)

- [ ] [安装pip报错：WARNING: Retrying (Retry(total=4,... - 知乎](https://zhuanlan.zhihu.com/p/97893886)

### pip 代理问题
```
WARNING: Retrying (Retry(total=4, connect=None, read=None, redirect=None, status=None)) after connection broken by 'ProxyError('Cannot connect to proxy.', FileNotFoundError(2, 'No such file or directory'))': /simple/pip/
```
[Support for web proxies is broken in pip 20.3 - Issue #9190 - pypa/pip](https://github.com/pypa/pip/issues/9190)
- pip 20.3.1

`pip install --upgrade --force-reinstall --no-cache-dir jupyter --trusted-host pypi.org`
```
WARNING: Retrying (Retry(total=4, connect=None, read=None, redirect=None, status=None)) after connection broken by 'ProxyError('Cannot connect to proxy.', FileNotFoundError(2, 'No such file or directory'))': /simple/jupyter/
```
`pip install pip==20.2 --trusted-host pypi.org`
```
WARNING: Retrying (Retry(total=4, connect=None, read=None, redirect=None, status=None)) after connection broken by 'ProxyError('Cannot connect to proxy.', FileNotFoundError(2, 'No such file or directory'))': /simple/pip/
```
把代理暂时关了就能避免

[networking - Python - Pip Install - Proxy Error - 'Cannot connect to proxy.', OSError' - Stack Overflow](https://stackoverflow.com/questions/49979354/python-pip-install-proxy-error-cannot-connect-to-proxy-oserror)

## clean
[Anaconda users: don't forget to clean your tarballs : Python](https://www.reddit.com/r/Python/comments/22bkz9/anaconda_users_dont_forget_to_clean_your_tarballs/)