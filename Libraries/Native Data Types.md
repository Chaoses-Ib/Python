# Native Data Types
- [ctypes](https://docs.python.org/3/library/ctypes.html)
- [Native Types](https://github.com/AlexAltea/ntypes)
- [NumPy](https://numpy.org/) ([GitHub](https://github.com/numpy/numpy))
- Integer-only
  - [fixedint](https://github.com/nneonneo/fixedint)
  - [cint](https://github.com/disconnect3d/cint)
  - [cinc](https://pypi.org/project/cinc/)
  - [mypyc](https://github.com/mypyc/mypyc/issues/837)

Comparison:

Feature | ctypes | Native Types
--- | --- | ---
Fixed-width integer | 8, ..., 64 | ✔️
Casting without overflow check | ✔️ | ✔️
Casting back to Python int | Explicit | Explicit
Basic arithmetic operators | ❌ | ✔️
Modulo operator | ❌ | ✔️
Bitwise operators | ❌ | ✔️
Shifting more than width\* | | Not masked
Accessing bit | ❌ | ✔️ & slicing
Comparison operators | ❌ | ✔️
 | | 
Floating point | 32, ..., long | ✔️
Casting back to Python float | Explicit | Explicit
Basic arithmetic operators | ❌ | ✔️
Comparison operators | ❌ | ✔️
 | | 
Native implementation | ✔️ | ❌

\*: Undefined behavior in C and C++, but masked on x86 and x86-64 [^shifting]

## Semantics differences
### Comparison
> Formally, if _a_, _b_, _c_, …, _y_, _z_ are expressions and _op1_, _op2_, …, _opN_ are comparison operators, then `a op1 b op2 c ... y opN z` is equivalent to `a op1 b and b op2 c and ... y opN z`, except that each expression is evaluated at most once.[^comparisons]

[^shifting]: [bit manipulation - Unexpected C/C++ bitwise shift operators outcome - Stack Overflow](https://stackoverflow.com/questions/9860538/unexpected-c-c-bitwise-shift-operators-outcome)
[^comparisons]: [Expressions - Python3 Docs](https://docs.python.org/3/reference/expressions.html#comparisons)