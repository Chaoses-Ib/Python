# Context Variables
[PEP 567 -- Context Variables | peps.python.org](https://peps.python.org/pep-0567/)

[contextvars --- Context Variables --- Python documentation](https://docs.python.org/3/library/contextvars.html)

> This concept (context variables) is similar to thread-local storage (TLS), but, unlike TLS, it also allows correctly keeping track of values per asynchronous task, e.g. `asyncio.Task`.

> Thread-local variables are insufficient for asynchronous tasks that execute concurrently in the same OS thread. Any context manager that saves and restores a context value using `threading.local()` will have its context values bleed to other code unexpectedly when used in async/await code.
>
> Context managers that have state should use Context Variables instead of [`threading.local()`](https://docs.python.org/3/library/threading.html#threading.local) to prevent this.

[Replace worker use of `threading.local()` with ContextVar - Issue #5485 - dask/distributed](https://github.com/dask/distributed/issues/5485)

[feat(runtime/run): share comfyui package context vars by default - Chaoses-Ib/ComfyScript](https://github.com/Chaoses-Ib/ComfyScript/commit/c67019548c6b7f7f99b6192efe237b3407f6f393)
