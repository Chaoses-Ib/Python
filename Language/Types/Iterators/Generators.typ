#import "@local/ib:0.1.0": *
#title[Generators]
#a[Expressions - Python3 Docs][https://docs.python.org/3/reference/expressions.html#generator-expressions]

= Generator expressions
#a[is for/while loop from python is a generator - Stack Overflow][https://stackoverflow.com/questions/44516289/is-for-while-loop-from-python-is-a-generator]

= Generator expressions vs List comprehensions
generator expressions 不是 list comprehensions
```py
>>> (i for i in range(1,5))
<generator object <genexpr> at 0x0000026397E540B0>
>>> tuple(i for i in range(1,5))
(1, 2, 3, 4)
>>> [i for i in range(1,5)]
[1, 2, 3, 4]
>>> {i for i in range(1,5)}
{1, 2, 3, 4}
>>> {i:i for i in range(1,5)}
{1: 1, 2: 2, 3: 3, 4: 4}
```
_#gray[#a[python - Generator expressions vs. list comprehensions - Stack Overflow][https://stackoverflow.com/questions/47789/generator-expressions-vs-list-comprehensions]]_

= yield
#a[python - What does the "yield" keyword do? - Stack Overflow][https://stackoverflow.com/questions/231767/what-does-the-yield-keyword-do]
