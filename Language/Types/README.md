# Type System
[Data model](https://docs.python.org/3/reference/datamodel.html)

[python - What are the differences between type() and isinstance()? - Stack Overflow](https://stackoverflow.com/questions/1549801/what-are-the-differences-between-type-and-isinstance)
> To summarize, `isinstance` caters for inheritance (an instance of a derived class *is an* instance of a base class, too), while checking for equality of `type` does not (it demands identity of types and rejects instances of subtypes, AKA subclasses).

[When is `type(instance)` different from `instance.__class__`? - Stack Overflow](https://stackoverflow.com/questions/42384991/when-is-typeinstance-different-from-instance-class)
- It is possible `type(x)` and `x.__class__` are not the same object, e.g. when `x` is a proxy object.

## Classes
[Custom classes](https://docs.python.org/3/reference/datamodel.html#custom-classes)

- `__dict__`

  [python - `getattr()` versus `__dict__` lookup, which is faster? - Stack Overflow](https://stackoverflow.com/questions/14084897/getattr-versus-dict-lookup-which-is-faster)

- [Inheritance](https://docs.python.org/3/tutorial/classes.html#inheritance)
  - All methods in Python are effectively `virtual`.
  - `super()`

    [python - What's the difference between super() and Parent class name? - Stack Overflow](https://stackoverflow.com/questions/42413670/whats-the-difference-between-super-and-parent-class-name)

- [`__new__`](https://docs.python.org/3/reference/datamodel.html#object.__new__)
  - `object.__new__(cls)` will not call `cls.__new__()`.

  ```python
  class A:
      def __new__(cls):
          print('A.__new__()')
          return super().__new__(cls)

      def __init__(self):
          print('A.__init__()')
      
      def a(self):
          print('a')

  class B(A):
      def __new__(cls):
          print('B.__new__()')
          return object.__new__(cls)

      def __init__(self):
          super().__init__()
          print('B.__init__()')

      def b(self):
          print('b')

  A.__new__ = lambda _cls: B.__new__(B)

  a = A()
  a.a()
  a.b()
  '''
  B.__new__()
  A.__init__()
  B.__init__()
  a
  b
  '''
  ```

- `__init__`
  
  [class - How to return a value from `__init__` in Python? - Stack Overflow](https://stackoverflow.com/questions/2491819/how-to-return-a-value-from-init-in-python)

  [python - How to overload `__init__` method based on argument type? - Stack Overflow](https://stackoverflow.com/questions/141545/how-to-overload-init-method-based-on-argument-type)

- `__hash__`
  
  [What is the default `__hash__` in python? - Stack Overflow](https://stackoverflow.com/questions/11324271/what-is-the-default-hash-in-python)

Others:
- [`type(name, bases, dict, **kwds)`](https://docs.python.org/3/library/functions.html#type)

  > This is essentially a dynamic form of the `class` statement.

[property](https://docs.python.org/3/library/functions.html#property)

## Proxies and wrappers
- [wrapt: A Python module for decorators, wrappers and monkey patching.](https://github.com/GrahamDumpleton/wrapt)

  [Better Python Decorators with Wrapt | Scout APM Blog](https://scoutapm.com/blog/better-python-decorators-with-wrapt)

  [Proxies and Wrappers](https://wrapt.readthedocs.io/en/latest/wrappers.html)
  - [`repr(proxied_object)` doesn't return `repr(self.__wrapped__)` - Issue #90 - GrahamDumpleton/wrapt](https://github.com/GrahamDumpleton/wrapt/issues/90)
  - [Best way to associate some data with `ObjectProxy`? - Issue #255 - GrahamDumpleton/wrapt](https://github.com/GrahamDumpleton/wrapt/issues/255)

- [objproxies: Proxies and wrappers for ordinary Python objects](https://github.com/neg3ntropy/objproxies)

## Metaclasses
[Data model - Python3 Docs](https://docs.python.org/3/reference/datamodel.html#metaclasses)

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
> 
> So much for "There should be one---and preferably only one---obvious way to do it."[^struct-so]

- [`NamedTuple`](https://docs.python.org/3/library/typing.html#typing.NamedTuple)
  - [namedtuple()](https://docs.python.org/3/library/collections.html#collections.namedtuple)
  - Named tuple instances do not have per-instance dictionaries, so they are lightweight and require no more memory than regular tuples.
- [dataclasses: Data Classes](https://docs.python.org/3/library/dataclasses.html)

  - [Passing default list argument to dataclasses - Stack Overflow](https://stackoverflow.com/questions/52063759/passing-default-list-argument-to-dataclasses)

    ```python
    argv: list[str] = dataclasses.field(default_factory=list)
    ```

- [`TypedDict`](https://docs.python.org/3/library/typing.html#typing.TypedDict)
  - A simple typed namespace. At runtime it is equivalent to a plain dict.
- [`SimpleNamespace`](https://docs.python.org/3/library/types.html#types.SimpleNamespace)
  - Unhashable.
  - Does not support item assignment.
- `dict`
- [`Enum`](Enums.md)

> When your data structure needs to/can be **immutable, hashable, iterable, unpackable, comparable then you can use `NamedTuple`**. If you need something **more complicated, for example, a possibility of inheritance** for your data structure then use `Dataclass`.

[dictionary - What are the main differences of NamedTuple and TypedDict in Python / mypy - Stack Overflow](https://stackoverflow.com/questions/53409117/what-are-the-main-differences-of-namedtuple-and-typeddict-in-python-mypy)

[python - Data Classes vs typing.NamedTuple primary use cases - Stack Overflow](https://stackoverflow.com/questions/51671699/data-classes-vs-typing-namedtuple-primary-use-cases)

## Type hints
[Type hints cheat sheet - mypy documentation](https://mypy.readthedocs.io/en/stable/cheat_sheet_py3.html)

[typing --- Support for type hints - Python3 Docs](https://docs.python.org/3/library/typing.html)

[python - Type annotations for Enum attribute - Stack Overflow](https://stackoverflow.com/questions/52624736/type-annotations-for-enum-attribute)
- `Literal`

[python - How can I specify the function type in my type hints? - Stack Overflow](https://stackoverflow.com/questions/37835179/how-can-i-specify-the-function-type-in-my-type-hints)

What is the type of a type (returned by `type()`)?

[python - collections.Iterable vs typing.Iterable in type annotation and checking for Iterable - Stack Overflow](https://stackoverflow.com/questions/52827463/collections-iterable-vs-typing-iterable-in-type-annotation-and-checking-for-iter)
- `typing`
  ```python
  Iterator = _alias(collections.abc.Iterator, 1)
  ```

### Postponed evaluation of annotations
If an enum is defined inside the class, how to make the type hint work?
```python
class C:
    class E(Enum):
        A = 1
        B = 2
class C(C):
    def __init__(self, e: C.E): ...
```
But this doesn't work in type stubs. Changing the base class's name to `_C` can fix it:
```python
class _C:
    class E(Enum):
        A = 1
        B = 2
class C(_C):
    def __init__(self, e: _C.E): ...
```
However, in type stubs, referencing the class itself before finishing the definition is actually legal:
```python
class C:
    class E(Enum):
        A = 1
        B = 2

    def __init__(self, e: C.E): ...
```

[python - How do I type hint a method with the type of the enclosing class? - Stack Overflow](https://stackoverflow.com/questions/33533148/how-do-i-type-hint-a-method-with-the-type-of-the-enclosing-class)

Workarounds:
- `'C'`
- [PEP 563 -- Postponed Evaluation of Annotations | peps.python.org](https://peps.python.org/pep-0563/) (Python 3.7)
  ```python
  from __future__ import annotations

  class C:
      def __init__(self, e: C.E): ...

      class E(Enum):
          A = 1
          B = 2
  ```
  This also makes `|` (`Union[]`) can be used on Python 3.7.
- [PEP 673 -- Self Type | peps.python.org](https://peps.python.org/pep-0673/) (Python 3.11)
- [PEP 649 -- Deferred Evaluation Of Annotations Using Descriptors | peps.python.org](https://peps.python.org/pep-0649/) (Python 3.13)

## Type stubs
[Type Stubs --- typing documentation](https://typing.readthedocs.io/en/latest/source/stubs.html)

[PEP 561 -- Distributing and Packaging Type Information | peps.python.org](https://peps.python.org/pep-0561/)

- [Stub files - mypy documentation](https://mypy.readthedocs.io/en/stable/stubs.html)
- [Type Stub Files - microsoft/pyright](https://github.com/microsoft/pyright/blob/main/docs/type-stubs.md)

  [How do stub files work and how to ensure that they're used? - microsoft/pyright - Discussion #3463](https://github.com/microsoft/pyright/discussions/3463)

[typeshed: Collection of library stubs for Python, with static types](https://github.com/python/typeshed)

[Writing and Maintaining Stub Files --- typing documentation](https://typing.readthedocs.io/en/latest/source/writing_stubs.html)

### Generation
- [Python stub runtime generator](https://github.com/micheleantonazzi/python-stub-runtime-generator)

[Generating stubs to autocomplete dynamic classes? : Python](https://www.reddit.com/r/Python/comments/16pzu2x/generating_stubs_to_autocomplete_dynamic_classes/)

## Type checkers
- [Pyright: Static Type Checker for Python](https://github.com/microsoft/pyright)
  - [Pylance infers wrong return type for overloaded function with Unknown arguments - Issue #1377 - microsoft/pylance-release](https://github.com/microsoft/pylance-release/issues/1377)


[^struct-so]: [dictionary - What are the main differences of NamedTuple and TypedDict in Python / mypy - Stack Overflow](https://stackoverflow.com/questions/53409117/what-are-the-main-differences-of-namedtuple-and-typeddict-in-python-mypy)