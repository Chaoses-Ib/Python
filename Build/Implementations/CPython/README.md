# CPython
[python/cpython: The Python programming language](https://github.com/python/cpython)

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

## Embedding
[Extending and Embedding the Python Interpreter --- Python 3 documentation](https://docs.python.org/3/extending/index.html#extending-index)

[1\. Embedding Python in Another Application --- Python 3 documentation](https://docs.python.org/3/extending/embedding.html#embedding-python-in-c)

## Bindings
### C++
- [boostorg/python: Boost.org python module](https://github.com/boostorg/python)
- [pybind/pybind11: Seamless operability between C++11 and Python](https://github.com/pybind/pybind11)

### Rust
- [PyO3: Rust bindings for the Python interpreter](https://github.com/PyO3/pyo3)
- [pyembed](https://gregoryszorc.com/docs/pyoxidizer/main/pyembed.html): Facilitates the control of an embedded Python interpreter.
  
  [Docs.rs](https://docs.rs/pyembed/latest/pyembed/)