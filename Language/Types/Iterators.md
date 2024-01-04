# Iterators
[syntax - Python: Make class iterable - Stack Overflow](https://stackoverflow.com/questions/5434400/python-make-class-iterable)
```python
class MetaFoo(type):
    def __iter__(self):
        for attr in dir(self):
            if not attr.startswith("__"):
                yield attr

class Foo(metaclass=MetaFoo):
    bar = "bar"
    baz = 1
```
[python - Iterate over a type without instantiating it - Stack Overflow](https://stackoverflow.com/questions/62762435/iterate-over-a-type-without-instantiating-it)