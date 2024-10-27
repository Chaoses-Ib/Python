# Enums
[enum --- Support for enumerations - Python3 Docs](https://docs.python.org/3/library/enum.html)

An enumeration:
- is a set of symbolic names (members) bound to unique values
- can be iterated over to return its canonical (i.e. non-alias) members in definition order
- uses *call* syntax to return members by value
- uses *index* syntax to return members by name

Is enum a sort of static dict? With the following differences:
- Item is returned by default
- `__getitem__()`/`__getattr__()` to get by key (`SimpleNamespace`)
- `__call__()` to get by value

[Enum HOWTO - Python3 Docs](https://docs.python.org/3/howto/enum.html)

Libraries:
- [aenum: Advanced Enumerations for Python](https://github.com/ethanfurman/aenum)

[How can I represent an 'Enum' in Python? - Stack Overflow](https://stackoverflow.com/questions/36932/how-can-i-represent-an-enum-in-python)

[Improve error message in enum for member name surrounded by underscore. - Issue #83148 - python/cpython](https://github.com/python/cpython/issues/83148) (Python 3.9)

[When should I subclass EnumMeta instead of Enum? - Stack Overflow](https://stackoverflow.com/questions/43730305/when-should-i-subclass-enummeta-instead-of-enum)

Creating large enums is slow. About 0.5s / 1000 members.

## Creation
- Function-call syntax: `Enum(id, members)`
  - `members` can be `list[K]` or `dict[K, V]`

## Nested enums
- Default (v3.13)

- `nonmember()` (v3.11)

- aenum

- `.value`

  ```python
  class _Inside(Enum):
      Downstairs = 'downstairs'
      Upstairs = 'upstairs'

  class Location(Enum):
      Outside = 'outside'
      Inside = _Inside 
      
  print(Location.Inside.value.Downstairs.value)
  ```

[Enums don't support nested classes - Issue #78157 - python/cpython](https://github.com/python/cpython/issues/78157)

[How to make nested enum also have value - Stack Overflow](https://stackoverflow.com/questions/54488648/how-to-make-nested-enum-also-have-value)

## Inheritance
[How to extend Python Enum? - Stack Overflow](https://stackoverflow.com/questions/33679930/how-to-extend-python-enum)

- [extendable-enum: Extend, subclass and reuse python Enums!](https://github.com/gweesip/extendable-enum)
- [aenum: Advanced Enumerations for Python](https://github.com/ethanfurman/aenum)

## StrEnum
- `class StrEnum(str, Enum): pass`
- [StrEnum: A Python Enum that inherits from str.](https://github.com/irgeek/StrEnum)
- [aenum: Advanced Enumerations for Python](https://github.com/ethanfurman/aenum)

[enums - Is there a way to use StrEnum in earlier python versions? - Stack Overflow](https://stackoverflow.com/questions/75040733/is-there-a-way-to-use-strenum-in-earlier-python-versions)