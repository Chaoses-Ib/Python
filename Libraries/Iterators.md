# Iterators
## [Built-in functions](https://docs.python.org/3/library/functions.html)
- [enumerate()](https://docs.python.org/3/library/functions.html#enumerate)
- [filter()](https://docs.python.org/3/library/functions.html#filter)
- [iter()](https://docs.python.org/3/library/functions.html#iter), [aiter()](https://docs.python.org/3/library/functions.html#aiter)
- [next()](https://docs.python.org/3/library/functions.html#next), [anext()](https://docs.python.org/3/library/functions.html#anext)
- [reversed()](https://docs.python.org/3/library/functions.html#reversed)
- [zip()](https://docs.python.org/3/library/functions.html#zip)

## [itertools](https://docs.python.org/3/library/itertools.html)
Generate ten 8-character, alphanumeric strings:
```python
import itertools
import string

gen = (''.join(p) for p in itertools.product(string.ascii_letters + string.digits, repeat=8))
print(list(itertools.islice(gen, 10)))
```