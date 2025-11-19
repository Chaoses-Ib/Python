# Async/await
[PEP 492 -- Coroutines with async and await syntax | peps.python.org](https://peps.python.org/pep-0492/)

[I don't understand Python's Asyncio | Armin Ronacher's Thoughts and Writings](https://lucumr.pocoo.org/2016/10/30/i-dont-understand-asyncio/)

[asyncio: Asynchronous I/O - Python3 Docs](https://docs.python.org/3/library/asyncio.html)

[Python has had async for 10 years -- why isn't it more popular?](https://tonybaloney.github.io/posts/why-isnt-python-async-more-popular.html)

[Thoughts on infectious systems: async/await and pure : ProgrammingLanguages](https://www.reddit.com/r/ProgrammingLanguages/comments/vofiyv/thoughts_on_infectious_systems_asyncawait_and_pure/)

[Designing Libraries for Async and Sync I/O](https://sethmlarson.dev/designing-libraries-for-async-and-sync-io)

[Some Thoughts on Asynchronous Programming --- Nick Coghlan's Python Notes 1.0 documentation](https://python-notes.curiousefficiency.org/en/latest/pep_ideas/async_programming.html)

## [Awaitable objects](https://docs.python.org/3/reference/datamodel.html#awaitable-objects)
[Coroutines and Tasks - Python3 Docs](https://docs.python.org/3/library/asyncio-task.html#awaitables)
- Coroutines
- Tasks
- [Futures](https://docs.python.org/3/library/asyncio-future.html)

  `Future` is **not** thread-safe.
  - [python 3.x - Futures: set result from a different thread - Stack Overflow](https://stackoverflow.com/questions/53090005/futures-set-result-from-a-different-thread)

[Python asyncio: Future vs Task - Stack Overflow](https://stackoverflow.com/questions/64851715/python-asyncio-future-vs-task)

[How to write your own async-awaitable coroutine function in Python? - Stack Overflow](https://stackoverflow.com/a/58274535/14105244)

[Why does executing async function returns <coroutine> instead of a promise ?](https://groups.google.com/g/brython/c/mBqfr9auat8)

## Tasks
- Some parts are written in C.
- [gh-100344: Provide C implementation for `asyncio.current_task` by itamaro - Pull Request #100345 - python/cpython](https://github.com/python/cpython/pull/100345) (Python 3.12)

  [gh-100344: Add C implementation for `asyncio.current_task` (#100345) - python/cpython@4cc63e0](https://github.com/python/cpython/commit/4cc63e0d4e4cf3299dcc0ea81616ba072ae5589d)
- [Double linked list implementation for asyncio tasks - Issue #107803 - python/cpython](https://github.com/python/cpython/issues/107803) (Python 3.14)

  [GH-107803: double linked list implementation for asyncio tasks (GH-10... - python/cpython@4717aaa](https://github.com/python/cpython/commit/4717aaa1a72d1964f1531a7c613f37ce3d9056d9)
- [gh-129898: per-thread current task implementation in asyncio by kumaraditya303 - Pull Request #129899 - python/cpython](https://github.com/python/cpython/pull/129899) (Python 3.14)

## Sync
- ~~[`nest_asyncio`: Patch asyncio to allow nested event loops](https://github.com/erdewit/nest_asyncio)~~
  - [`nest-asyncio2`: Patch asyncio to allow nested event loops](https://github.com/Chaoses-Ib/nest-asyncio2)

  Old issues:
  - ~~[After `apply()` and `asyncio.run()`, Jupyter kernel cannot execute any code - Issue #87](https://github.com/erdewit/nest_asyncio/issues/87)~~ (v1.5.9)
  - [Add support for revert by CharlieJiangXXX - Pull Request #88](https://github.com/erdewit/nest_asyncio/pull/88)
    - [feat: NestedAsyncIO contextmanager by andrewthetechie - Pull Request #872 - andrewthetechie/pydantic-aioredis](https://github.com/andrewthetechie/pydantic-aioredis/pull/872)
  - Doesn't support `loop_factory`
    - [add `loop_factory` kwarg - PhilReinhold/nest\_asyncio@6f34a4d](https://github.com/PhilReinhold/nest_asyncio/commit/6f34a4d411ff6433cd26e448e985d5b8b9e579b9)

    [\[Bug\]: Please stop using deprecated/archived `nest_asyncio` package - Issue #19812 - run-llama/llama\_index](https://github.com/run-llama/llama_index/issues/19812)
  - Python 3.14+: Will make `asyncio.current_task()` return `None`: [nest_asyncio_task.py](nest_asyncio_task.py).
    - ~~[1.5.2 and 1.5.3 broke some `current_task` detection - Issue #64](https://github.com/erdewit/nest_asyncio/issues/64)~~
    - [danielhollas/nest_asyncio](https://github.com/danielhollas/nest_asyncio)

    [2353141 -- python-nest-asyncio fails to build with Python 3.14: test\_timeout: RuntimeError: Timeout should be used inside a task](https://bugzilla.redhat.com/show_bug.cgi?id=2353141)

    [Heads up: nest-asyncio is no longer actively maintained - Issue #1381 - ipython/ipykernel](https://github.com/ipython/ipykernel/issues/1381)

    [Heads up: nest-asyncio is no longer actively maintained - Issue #328 - jupyter/nbclassic](https://github.com/jupyter/nbclassic/issues/328)

  [nest\_asyncio dependency is no longer maintained - Issue #7938 - pyvista/pyvista](https://github.com/pyvista/pyvista/issues/7938)

  [Replace or remove `nest_asyncio` due to lack of maintenance - Issue #101 - danielnsilva/semanticscholar](https://github.com/danielnsilva/semanticscholar/issues/101)

- [greenlet: Lightweight in-process concurrent programming](https://github.com/python-greenlet/greenlet)
  - [greenback: Reenter an asyncio or Trio event loop from synchronous code](https://github.com/oremanj/greenback)
  - [gfmio/asyncio-gevent: asyncio & gevent in harmony](https://github.com/gfmio/asyncio-gevent)

  [Replace `nest_asyncio` with greenlets by douglas-raillard-arm - Pull Request #683 - ARM-software/devlib](https://github.com/ARM-software/devlib/pull/683)
- [asgiref: ASGI specification and utilities](https://github.com/django/asgiref/)
  - Thread
- [miyakogi/syncer: Async to sync converter](https://github.com/miyakogi/syncer)
  - `ayncio.get_event_loop().run_until_complete()`
- [unasync: The async transformation code.](https://github.com/python-trio/unasync/)
- [asyncio-anywhere: Python package that makes it easy to run fast asyncio code](https://github.com/phlogisticfugu/asyncio-anywhere)
  - Thread/uvloop

[Wrapping async functions for use in sync code - Async-SIG - Discussions on Python.org](https://discuss.python.org/t/wrapping-async-functions-for-use-in-sync-code/8606)

[Running async code from sync code in Python - death and gravity](https://death.andgravity.com/asyncio-bridge)

[python - How to call async function in sync code and break async/await chain (i.e. how to wrap an async function in a sync function) - Stack Overflow](https://stackoverflow.com/questions/68744830/how-to-call-async-function-in-sync-code-and-break-async-await-chain-i-e-how-to)

[asynchronous - How to call a async function from a synchronized code Python - Stack Overflow](https://stackoverflow.com/questions/51762227/how-to-call-a-async-function-from-a-synchronized-code-python)

[asynchronous - Call async function from sync function, while the synchronous function continues : Python - Stack Overflow](https://stackoverflow.com/questions/55647753/call-async-function-from-sync-function-while-the-synchronous-function-continues)

[python - Wait for async function to complete - Stack Overflow](https://stackoverflow.com/questions/57234827/wait-for-async-function-to-complete)

## Executors
[concurrent.futures.Executor](https://docs.python.org/3/library/concurrent.futures.html#concurrent.futures.Executor)

[Python asyncio event loop in a separate thread](https://gist.github.com/dmfigol/3e7d5b84a16d076df02baa9f53271058)

[python - Send asyncio tasks to loop running in other thread - Stack Overflow](https://stackoverflow.com/questions/32059732/send-asyncio-tasks-to-loop-running-in-other-thread)

[multithreading - How to combine python asyncio with threads? - Stack Overflow](https://stackoverflow.com/questions/28492103/how-to-combine-python-asyncio-with-threads)

[How do I set the asyncio event loop for a thread in Python? - Stack Overflow](https://stackoverflow.com/questions/52298922/how-do-i-set-the-asyncio-event-loop-for-a-thread-in-python)
