# Mappings
[Data model - Python3 Docs](https://docs.python.org/3/reference/datamodel.html#mappings)

## Dictionaries
Dictionaries preserve insertion order, meaning that keys will be produced in the same order they were added sequentially over the dictionary. Replacing an existing key does not change the order, however removing a key and re-inserting it will add it to the end instead of keeping its old place. (Python 3.7+, CPython 3.6+)

[python - What would a "frozen dict" be? - Stack Overflow](https://stackoverflow.com/questions/2703599/what-would-a-frozen-dict-be)
- [frozendict: A simple immutable mapping for python](https://github.com/slezica/python-frozendict)
- [types.MappingProxyType](https://docs.python.org/3/library/types.html#types.MappingProxyType)
  - `hash()` (Python 3.12)

[Box: Python dictionaries with advanced dot notation access](https://github.com/cdgriffith/Box)