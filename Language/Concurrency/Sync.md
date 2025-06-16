# Synchronization Primitives
## asyncio
[Synchronization Primitives - Python3 Docs](https://docs.python.org/3/library/asyncio-sync.html)
> asyncio primitives are not thread-safe, therefore they should not be used for OS thread synchronization (use [`threading`](https://docs.python.org/3/library/threading.html#module-threading "threading: Thread-based parallelism.") for that);

### [`Event`](https://docs.python.org/3/library/asyncio-sync.html#asyncio.Event)
- `wait()` is a coroutine method and cannot be used with `asyncio.wait()`
  - `asyncio.create_task()`

  [Deprecate-remove passing coroutine objects to asyncio.wait() - Issue #78971 - python/cpython](https://github.com/python/cpython/issues/78971)

  [python - The explicit passing of coroutine objects to asyncio.wait() is deprecated - Stack Overflow](https://stackoverflow.com/questions/75666486/the-explicit-passing-of-coroutine-objects-to-asyncio-wait-is-deprecated)

- How to set once, i.e. `set() + clear()`?

  Basically remove `self._value` and the work is done. But it's just not there...

  [feat(runtime/virtual): wake `result()` when set new output (#108) - Chaoses-Ib/ComfyScript@78e381f](https://github.com/Chaoses-Ib/ComfyScript/commit/78e381fd6b0d6d2e664353eff1e399f8e892a4fc)

[Clarify asyncio.Event semantics - Stack Overflow](https://stackoverflow.com/questions/75241063/clarify-asyncio-event-semantics)
