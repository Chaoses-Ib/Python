# Bool
## Truth value testing
[Truth Value Testing - Python3 Docs](https://docs.python.org/3/library/stdtypes.html#truth)
> By default, an object is considered true unless its class defines either a `__bool__()` method that returns False or a `__len__()` method that returns zero, when called with the object. Here are most of the built-in objects considered false:
> - constants defined to be false: `None` and `False`
> - zero of any numeric type: `0`, `0.0`, `0j`, `Decimal(0)`, `Fraction(0,1)`
> - empty sequences and collections: `''`, `()`, `[]`, `{}`, `set()`, `range(0)`

`if v := f()` is error-prone.