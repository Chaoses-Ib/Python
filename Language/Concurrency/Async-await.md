# Async/await
[PEP 492 -- Coroutines with async and await syntax | peps.python.org](https://peps.python.org/pep-0492/)

[I don't understand Python's Asyncio | Armin Ronacher's Thoughts and Writings](https://lucumr.pocoo.org/2016/10/30/i-dont-understand-asyncio/)

[asyncio: Asynchronous I/O - Python3 Docs](https://docs.python.org/3/library/asyncio.html)

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

## Sync
- [`nest_asyncio`: Patch asyncio to allow nested event loops](https://github.com/erdewit/nest_asyncio)
  - ~~[After `apply()` and `asyncio.run()`, Jupyter kernel cannot execute any code - Issue #87](https://github.com/erdewit/nest_asyncio/issues/87)~~ (v1.5.9)
- [asgiref: ASGI specification and utilities](https://github.com/django/asgiref/)
- [greenback: Reenter an asyncio or Trio event loop from synchronous code](https://github.com/oremanj/greenback)
- [syncer: Async to sync converter](https://github.com/miyakogi/syncer)
- [unasync: The async transformation code.](https://github.com/python-trio/unasync/)

[Wrapping async functions for use in sync code - Async-SIG - Discussions on Python.org](https://discuss.python.org/t/wrapping-async-functions-for-use-in-sync-code/8606)

[python - How to call async function in sync code and break async/await chain (i.e. how to wrap an async function in a sync function) - Stack Overflow](https://stackoverflow.com/questions/68744830/how-to-call-async-function-in-sync-code-and-break-async-await-chain-i-e-how-to)

[asynchronous - How to call a async function from a synchronized code Python - Stack Overflow](https://stackoverflow.com/questions/51762227/how-to-call-a-async-function-from-a-synchronized-code-python)

[asynchronous - Call async function from sync function, while the synchronous function continues : Python - Stack Overflow](https://stackoverflow.com/questions/55647753/call-async-function-from-sync-function-while-the-synchronous-function-continues)

[python - Wait for async function to complete - Stack Overflow](https://stackoverflow.com/questions/57234827/wait-for-async-function-to-complete)

## Executors
[concurrent.futures.Executor](https://docs.python.org/3/library/concurrent.futures.html#concurrent.futures.Executor)

[Python asyncio event loop in a separate thread](https://gist.github.com/dmfigol/3e7d5b84a16d076df02baa9f53271058)