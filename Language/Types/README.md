# Type System
[Data model](https://docs.python.org/3/reference/datamodel.html)

## Classes
[Custom classes](https://docs.python.org/3/reference/datamodel.html#custom-classes)

## Structures
> Python and its community are wrestling with the "struct" problem: how to best group related values into composite data objects that allow logical/easy accessing of components (typically by name). There are *many* competing approaches:
> - `collections.namedtuple` instances
> - dictionaries (with a fixed/known set of keys)
> - attribute-accessible dictionaries (like [stuf](https://pypi.org/project/stuf/))
> - the [attrs](https://github.com/python-attrs/attrs) library
> - PEP 557 [dataclasses](https://docs.python.org/3/library/dataclasses.html)
> - plain old bespoke objects hand-crafted for every struct type
> - sequences like `tuple` and `list` with implied meanings for each position/slot (archaic but extremely common)
> - etc.
> So much for "There should be one---and preferably only one---obvious way to do it."[^struct-so]

- [`NamedTuple`](https://docs.python.org/3/library/typing.html#typing.NamedTuple)
  - [namedtuple()](https://docs.python.org/3/library/collections.html#collections.namedtuple)
  - Named tuple instances do not have per-instance dictionaries, so they are lightweight and require no more memory than regular tuples.
- [dataclasses: Data Classes](https://docs.python.org/3/library/dataclasses.html)
- [`TypedDict`](https://docs.python.org/3/library/typing.html#typing.TypedDict)
  - A simple typed namespace. At runtime it is equivalent to a plain dict.
- [`SimpleNamespace`](https://docs.python.org/3/library/types.html#types.SimpleNamespace)
  - Unhashable.
  - Does not support item assignment.
- `dict`

> When your data structure needs to/can be **immutable, hashable, iterable, unpackable, comparable then you can use `NamedTuple`**. If you need something **more complicated, for example, a possibility of inheritance** for your data structure then use `Dataclass`.

[dictionary - What are the main differences of NamedTuple and TypedDict in Python / mypy - Stack Overflow](https://stackoverflow.com/questions/53409117/what-are-the-main-differences-of-namedtuple-and-typeddict-in-python-mypy)

[python - Data Classes vs typing.NamedTuple primary use cases - Stack Overflow](https://stackoverflow.com/questions/51671699/data-classes-vs-typing-namedtuple-primary-use-cases)

## Type Hints
[Type hints cheat sheet - mypy documentation](https://mypy.readthedocs.io/en/stable/cheat_sheet_py3.html)

[typing --- Support for type hints - Python3 Docs](https://docs.python.org/3/library/typing.html)


[^struct-so]: [dictionary - What are the main differences of NamedTuple and TypedDict in Python / mypy - Stack Overflow](https://stackoverflow.com/questions/53409117/what-are-the-main-differences-of-namedtuple-and-typeddict-in-python-mypy)