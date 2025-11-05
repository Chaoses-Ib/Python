# CPython
[python/cpython: The Python programming language](https://github.com/python/cpython)

## Versions
[Status of Python versions](https://devguide.python.org/versions/)

Breaking changes:
- [Cold-blooded software | Hacker News](https://news.ycombinator.com/item?id=38793206)
  
  > Python is a really bad example of cold blooded software. There is constant breaking changes with it (both runtime and tooling).

  > The Python 3.11 release notes have a pretty lengthy list of removed or changed Python and C APIs followed by guidance on porting to 3.11, which implies potentially breaking changes.

  > Python's changes between releases are not limited to removing deprecated APIs. Sometimes semantics changes in breaking ways, or new reserved words crop up, etc. etc. It certainly is Russian roulette trying to run python code on any version other than the one it was written for.

  > For me switching to Python 3.11 was really tough because of various legacy stuff removals (like coroutine decorators etc). While my code did not use these, the dependencies did. For some dependencies I had to switch to different libraries altogether - and that required rewriting my code to work with them.
  > 
  > There was also some time in the past when async became a keyword. It turned out many packages had variables named async and that caused quite a bit of pain too.

[Python 终于决定要提升一下性能了 - V2EX](https://www.v2ex.com/t/776893)
> 其实很多时候不是技术问题，反倒是社会学问题，比如社区的组织形态决定他们能贡献何种方式的代码。python 的社区组织形态导致各自为战的工作者对于语法上的小的优化和改动频繁发表意见，而对于 cpython 解释器这类的问题没什么想法。

[安装了 python3.10，满吃惊的 - V2EX](https://www.v2ex.com/t/843931)
> 在我印象中，CPython 在 3.6 以后的版本中, 对虚拟机内部的实现做了大量的修改， 比如说 FastCall 机制等。 这些确实能提高 Python 本身的性能。但是对于 C/C++实现的第三方库而言, 如果想获得性能提升， 必须主动适配这些新特性。

## API
[C API Stability - Python3 Docs](https://docs.python.org/3/c-api/stable.html)

There are two tiers of C API with different stability expectations:
- [Unstable API](https://docs.python.org/3/c-api/stable.html#unstable-c-api), may change in minor versions without a deprecation period. It is marked by the `PyUnstable` prefix in names.

- [Limited API](https://docs.python.org/3/c-api/stable.html#limited-c-api) (abi3), is compatible across several minor releases. When [`Py_LIMITED_API`](https://docs.python.org/3/c-api/stable.html#c.Py_LIMITED_API "Py_LIMITED_API") is defined, only this subset is exposed from `Python.h`.

  [PEP 384 -- Defining a Stable ABI | peps.python.org](https://peps.python.org/pep-0384/)

- Stable ABI

  [Let's get rid of the stable ABI, but keep the limited API - Core Development - Discussions on Python.org](https://discuss.python.org/t/lets-get-rid-of-the-stable-abi-but-keep-the-limited-api/18458)

[HPy: A better C API for Python](https://github.com/hpyproject/hpy/) ([Website](https://hpyproject.org/))
- [HPy: Better Python C API in Practice | by Štěpán Šindelář | graalvm | Medium](https://medium.com/graalvm/hpy-better-python-c-api-in-practice-79328246e2f8)

  > What makes HPy different from the CPython stable ABI, is that the same binary will run also on any alternative Python implementation that natively supports HPy. At this point, those are GraalPy and PyPy.

## Embedding
[Extending and Embedding the Python Interpreter --- Python 3 documentation](https://docs.python.org/3/extending/index.html#extending-index)

[1\. Embedding Python in Another Application --- Python 3 documentation](https://docs.python.org/3/extending/embedding.html#embedding-python-in-c)

venv:
- [Make pyvenv style virtual environments easier to configure when embedding Python - Issue #66409 - python/cpython](https://github.com/python/cpython/issues/66409)
- [Make it easier to use a venv with an embedded Python interpreter - Issue #79887 - python/cpython](https://github.com/python/cpython/issues/79887)

## Bindings
### C++
- [boostorg/python: Boost.org python module](https://github.com/boostorg/python)
- [pybind/pybind11: Seamless operability between C++11 and Python](https://github.com/pybind/pybind11)

### Rust
[→Rust FFI: Python](https://github.com/Chaoses-Ib/Rust/blob/main/Language/FFI.md#python)

- [PyO3: Rust bindings for the Python interpreter](https://github.com/PyO3/pyo3)
- [pyembed](https://gregoryszorc.com/docs/pyoxidizer/main/pyembed.html): Facilitates the control of an embedded Python interpreter.
  
  [Docs.rs](https://docs.rs/pyembed/latest/pyembed/)