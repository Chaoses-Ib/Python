# Implementations
[Alternative Python Implementations | Python.org](https://www.python.org/download/alternatives/)

[PythonImplementations - Python Wiki](https://wiki.python.org/moin/PythonImplementations)

[Python Interpreters Benchmarks](https://pybenchmarks.org/)

刚学 Python 时以为 Python 冰清玉洁，现在才发现和 C++ 一样花花肠子。

## C/C++
- [→CPython](CPython/README.md)

- [→Cython](Cython/README.md)

- Nuitka

  [Nuitka Home](https://nuitka.net/)

  [Nuitka/Nuitka: Nuitka is a Python compiler written in Python.](https://github.com/Nuitka/Nuitka)

  A Python-to-C++ compiler using libpython at runtime, attempting some compile-time and run-time optimisations. Interacts with CPython runtime.

  [Nuitka vs Cython | Python Interpreters Benchmarks](https://pybenchmarks.org/u64q/nuitka.php)

  相比 Cython 并没有什么优势，部分项目甚至远慢于 Cython。

- MyPyC

  [mypyc/mypyc: Compile type annotated Python to fast C extensions](https://github.com/mypyc/mypyc)

  Compiles fully typed Python code to a C extension, based on mypy.

## Rust
- [RustPython: A Python Interpreter written in Rust](https://github.com/RustPython/RustPython)

  [\[RFC\] What are the compatibility goals for RustPython? - Issue #1940 - RustPython/RustPython](https://github.com/RustPython/RustPython/issues/1940)
  - [How to deal with C-API extensions? - Issue #158 - RustPython/RustPython](https://github.com/RustPython/RustPython/issues/158)

  - 2024-02 [RustPython | Hacker News](https://news.ycombinator.com/item?id=39286458)

    > Packages that rely on c dependencies like numpy, etc. only work if you write a custom implementation by hand; the “normal” package flat out doesn’t (and cannot) work. So basically you get no packages that use native extensions, unless the project explicitly implements support for them.
    >
    > Pypy is the only implementation I'm aware of that has implemented a c api that is mostly compatible (see [https://doc.pypy.org/en/latest/faq.html#do-c-extension-modul...](https://doc.pypy.org/en/latest/faq.html#do-c-extension-modules-work-with-pypy)) For eg. Python running in a .net host or a Java host... I think this kind of compatibility would just be flat out impossible. For rust... hm... probably possible. For wasm? Definitely not.

  - 2024-02 [RustPython: An open source An open source Python 3 (CPython >= 3.11.0) interpreter written in Rust : r/rust](https://www.reddit.com/r/rust/comments/1al10zh/rustpython_an_open_source_an_open_source_python_3/)

    > I think in terms of completely replacing CPython, RustPython would have a long way to go - one notable feature that's missing at this moment is native modules; that would still have to be done via a C-compatible ABI, and there's a lot of ABI surface area to cover with that.

## Python
- [PyPy](https://www.pypy.org/)

  Python in Python, includes a tracing JIT compiler.

  套了层解释器还比解释器本身跑得快，这事确实很傻逼，有这功夫为什么不拿来优化 CPython？

- x-python

  [rocky/x-python: A Python implementation of the C Python Interpreter](https://github.com/rocky/x-python/)

  The C Python Interpreter written in Python; useful for educational purposes. There is also bytecode debugger for it

## .NET
### Implementations
- [IronPython](https://ironpython.net/) ([repo](https://github.com/IronLanguages/ironpython3))
  
  An implementation of the Python programming language which is tightly integrated with .NET. The current target is Python 3.4, although features and behaviors from later versions may be included.

  [IronPython 2](https://github.com/IronLanguages/ironpython2)
  
- [Pyjion](https://www.trypyjion.com/) ([repo](https://github.com/tonybaloney/Pyjion))
  
  A JIT extension for CPython that compiles your Python code into native CIL and executes it using the .NET CLR.

- [pytocs](https://github.com/uxmal/pytocs)
  
  Converts Python source to C#.

### Bindings
- [Python.NET](http://pythonnet.github.io/) ([repo](https://github.com/pythonnet/pythonnet))  
  CPython ↔ .NET, mainly for binding .NET → CPython.
  - [Python.Included](https://github.com/henon/Python.Included)  
    An automatic deployment mechanism for .NET packages which depend on the embedded Python distribution.

## Java
- Jython

  [Home | Jython](https://www.jython.org/)

  [jython/jython: Python for the Java Platform](https://github.com/jython/jython)

- GraalPython

  [oracle/graalpython: A Python 3 implementation built on GraalVM](https://github.com/oracle/graalpython)

## JS
- Brython

  [Brython](https://www.brython.info/)

  [brython-dev/brython: Brython (Browser Python) is an implementation of Python 3 running in the browser](https://github.com/brython-dev/brython)

  A way to run Python in the browser through translation to JavaScript.

  `<script type="text/python">`

  amazing!

- pyjs

  [Pyjs](http://pyjs.org/)

  [pyjs/pyjs: Pyjs canonical sources. Start here!](https://github.com/pyjs/pyjs)

  A Python to JavaScript compiler plus Web/GUI framework.

- RapydScript

  [atsepkov/RapydScript: Python-inspired, decluttered JavaScript](https://github.com/atsepkov/RapydScript)

  A Python-like language that compiles to JavaScript.

- Transcrypt

  [Transcrypt - Python in the browser - Lean, fast, open!](http://www.transcrypt.org/)

  [QQuick/Transcrypt: Python 3.7 to JavaScript compiler - Lean, fast, open! -](https://github.com/qquick/Transcrypt)

  Python 3.6 to JavaScript precompiler with lean and fast generated code, sourcemaps, built-in minification, optional static type-checking, JSX support.

## MicroPython
[micropython/micropython: MicroPython - a lean and efficient Python implementation for microcontrollers and constrained systems](https://github.com/micropython/micropython)

### CircuitPython
[CircuitPython](https://circuitpython.org/)

[adafruit/circuitpython: CircuitPython - a Python implementation for teaching coding with microcontrollers](https://github.com/adafruit/circuitpython)