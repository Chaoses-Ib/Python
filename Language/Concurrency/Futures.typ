#import "@local/ib:0.1.0": *
#title[Futures]
#quote[Future objects are used to bridge low-level callback-based code with high-level async/await code.]

#a[Futures - Python3 Docs][https://docs.python.org/3/library/asyncio-future.html]

= Future result proxy
```py
# /// script
# requires-python = ">=3.8"
# dependencies = [
#     "wrapt~=2.0",
# ]
# ///
import asyncio
import wrapt.proxies

fut = asyncio.Future()
# Or interface=inspect.signature(async_f).return_annotation
r = wrapt.proxies.LazyObjectProxy(fut.result, interface=str)

try:
    r.removesuffix('')
except asyncio.InvalidStateError as e:
    print(e)

fut.set_result('1')
print(r.removesuffix(''))
```
