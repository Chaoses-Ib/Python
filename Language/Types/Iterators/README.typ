#import "@local/ib:0.1.0": *
#title[Iterators]
#a[PEP 234 -- Iterators][https://peps.python.org/pep-0234/]

Iterable 实现 ```py __iter__()``` 和 ```py __next__()``` \
Iterator 通过 ```py iter()``` 得到，通过 ```py next()``` 前进

#a[Python 的可迭代物件、迭代器和產生器. 這篇文章是參考 Vincent Driessen 所寫的 Iterables... | by HongDa Yen | Taiwan AI Academy | Medium][https://medium.com/ai-academy-taiwan/python-%E7%9A%84%E5%8F%AF%E8%BF%AD%E4%BB%A3%E7%89%A9%E4%BB%B6-%E8%BF%AD%E4%BB%A3%E5%99%A8%E5%92%8C%E7%94%A2%E7%94%9F%E5%99%A8-236d19c4051e]

= Iterable classes
#a[syntax - Python: Make class iterable - Stack Overflow][https://stackoverflow.com/questions/5434400/python-make-class-iterable]
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
#a[python - Iterate over a type without instantiating it - Stack Overflow][https://stackoverflow.com/questions/62762435/iterate-over-a-type-without-instantiating-it]

= ```py dict```
- ```py for key in d```
- ```py for key, value in d.items()```
  
  相比 ```py d[key]``` 性能更高

= ```py find_if```
```py
next(x for x in iterable if condition(x))
```
```py
next((x for x in iterable if condition(x)), default)
```
_#gray[#a[python - Get the first item from an iterable that matches a condition - Stack Overflow][https://stackoverflow.com/questions/2361426/get-the-first-item-from-an-iterable-that-matches-a-condition]]_
