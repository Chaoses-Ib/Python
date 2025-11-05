# [RustPython](https://rustpython.github.io/)
[GitHub](https://github.com/RustPython/RustPython)

> A Python Interpreter written in Rust.

- [Architecture](https://github.com/RustPython/RustPython/blob/main/architecture/architecture.md)
  - [rustpython-vm](https://docs.rs/rustpython-vm/)
  - [rustpython-compiler](https://docs.rs/rustpython-compiler/)
  - [rustpython-stdlib](https://docs.rs/rustpython-stdlib/)
  - [rustpython-pylib](https://docs.rs/rustpython-pylib/)

    > This crate includes the compiled python bytecode of the RustPython standard library. The most common way to use this crate is to just add the `"freeze-stdlib"` feature to `rustpython-vm`, in order to automatically include the python part of the standard library into the binary.
  - [rustpython](https://docs.rs/rustpython/)
- Poorly documented

[Benchmarks](https://rustpython.github.io/benchmarks)

[RustPython: A Python Interpreter Written in Rust | Hacker News](https://news.ycombinator.com/item?id=41139595)

## Compatibility
[CPython test compatibility](https://rustpython.github.io/pages/regression-tests-results.html)

[\[RFC\] What are the compatibility goals for RustPython? - Issue #1940](https://github.com/RustPython/RustPython/issues/1940)
- [How to deal with C-API extensions? - Issue #158](https://github.com/RustPython/RustPython/issues/158)

- 2024-02 [RustPython | Hacker News](https://news.ycombinator.com/item?id=39286458)

  > Packages that rely on c dependencies like numpy, etc. only work if you write a custom implementation by hand; the “normal” package flat out doesn’t (and cannot) work. So basically you get no packages that use native extensions, unless the project explicitly implements support for them.
  >
  > Pypy is the only implementation I'm aware of that has implemented a c api that is mostly compatible (see [https://doc.pypy.org/en/latest/faq.html#do-c-extension-modul...](https://doc.pypy.org/en/latest/faq.html#do-c-extension-modules-work-with-pypy)) For eg. Python running in a .net host or a Java host... I think this kind of compatibility would just be flat out impossible. For rust... hm... probably possible. For wasm? Definitely not.

- 2024-02 [RustPython: An open source An open source Python 3 (CPython >= 3.11.0) interpreter written in Rust : r/rust](https://www.reddit.com/r/rust/comments/1al10zh/rustpython_an_open_source_an_open_source_python_3/)

  > I think in terms of completely replacing CPython, RustPython would have a long way to go - one notable feature that's missing at this moment is native modules; that would still have to be done via a C-compatible ABI, and there's a lot of ABI surface area to cover with that.

## Binary size
- [Investigate the size of the binary - Issue #1060](https://github.com/RustPython/RustPython/issues/1060)
  - Linux: 11 MB
  - macOS: 14 MB
  - Windows: 16 MB
- [\[RFC\] Reduce Wasm binary size - Issue #4203](https://github.com/RustPython/RustPython/issues/4203)
  - 17 MB
    - Frozen stdlib: ~11.5 MB
  - [Slim down the WebAssembly build binary size - Issue #5403](https://github.com/RustPython/RustPython/issues/5403)
- [\[RFC\] Consider a pure python stdlib - Issue #5492](https://github.com/RustPython/RustPython/issues/5492)
- > RustPython binary is 27 MB, while CPython is 10 MB including the standard library.
