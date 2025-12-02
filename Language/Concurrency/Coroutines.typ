#import "@local/ib:0.1.0": *
#title[Coroutines]
= Generator-based coroutines
Generator-based coroutines, iterable coroutines, enhanced generators.

#a[PEP 342 -- Coroutines via Enhanced Generators][https://peps.python.org/pep-0342/]

#quote(block: true)[
Python's generator functions are almost coroutines -- but not quite -- in that they allow pausing execution to produce a value, but do not provide for values or exceptions to be passed in when execution resumes. They also do not allow execution to be paused within the `try` portion of `try/finally` blocks, and therefore make it difficult for an aborted coroutine to clean up after itself.

Also, generators cannot yield control while other functions are executing, unless those functions are themselves expressed as generators, and the outer generator is written to yield in response to values yielded by the inner generator. This complicates the implementation of even relatively simple use cases like asynchronous communications, because calling any functions either requires the generator to _block_ (i.e. be unable to yield
control), or else a lot of boilerplate looping code must be added around every needed function call.
]

#a[PEP 380 -- Syntax for Delegating to a Subgenerator][https://peps.python.org/pep-0380/]
- #a[Best way to receive the 'return' value from a python generator - Stack Overflow][https://stackoverflow.com/questions/34073370/best-way-to-receive-the-return-value-from-a-python-generator]

#quote(block: true)[
All of this makes generator functions quite similar to coroutines; they yield multiple times, they have more than one entry point and their execution can be suspended. The only difference is that a generator function cannot control where the execution should continue after it yields; the control is always transferred to the generator’s caller.
]

#a[A Journey to Python Async - 3. Generators as Coroutines - DEV Community][https://dev.to/uponthesky/python-a-journey-to-python-async-3-generators-as-coroutines-2j5e]

#a[Python generators and coroutines - Stack Overflow][https://stackoverflow.com/questions/5948643/python-generators-and-coroutines]

= Native coroutines
#a[PEP 492 -- Coroutines with async and await syntax][https://peps.python.org/pep-0492/]

#quote(block: true)[
Feedback on the initial beta release of Python 3.5 resulted in a redesign of the object model supporting this PEP to more clearly separate native coroutines from generators - rather than being a new kind of generator, native coroutines are now their own completely distinct type.
]
- ```py @types.coroutine``` can apply ```c CO_ITERABLE_COROUTINE``` flag to generator-function’s code object, making it return a coroutine object.
- Generator-based coroutines can ```py yield from``` native coroutine objects.

#a[A Journey to Python Async - 4. Native Coroutines - DEV Community][https://dev.to/uponthesky/python-a-journey-to-python-async-4-native-coroutines-3d75)]

== ```py async def```
```py async def``` functions are always coroutines, even if they do not contain ```py await``` expressions.

```py
async def f():
    print(1)
f()
# <coroutine object f at 0x42>
```

For generators, it depends on if the function body contains `yield` (regardless of if it may be executed or not).

However, it is possible to wrap generators and coroutines to automatically advance to their first yield point when initially called.
This allows a function to return an value or generator/coroutine object dynamically,
such as depending on if there is a running event loop or not.
For example:
```py
async def f():
    print(1)
    print(2)
    return 3
co = f()
try:
    co.send(None)
except StopIteration as e:
    print(e.value)
```

It is also possible to return an auto object that behaves like coroutines if `await`ed and like direct values otherwise,
with proxies like ```py wrapt.proxies.LazyObjectProxy```,
as long as the value doesn't have methods named the same as coroutines'.

= Joining coroutines
- ```py [await co for co in coroutines]```
- ```py asyncio.gather()```
- ```py asyncio.TaskGroup```

#a[asynchronous - Join for async function in python - Stack Overflow][https://stackoverflow.com/questions/51580947/join-for-async-function-in-python]
