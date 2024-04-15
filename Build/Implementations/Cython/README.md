# Cython
[Cython: C-Extensions for Python](https://cython.org/)

[cython/cython: The most widely used Python to C compiler](https://github.com/cython/cython)

A widely used optimising Python-to-C compiler, CPython extension module generator, and wrapper language for binding external libraries. Interacts with CPython runtime and supports embedding CPython in stand-alone binaries.


[Tutorials --- Cython 0.29.26 documentation](https://cython.readthedocs.io/en/stable/src/tutorial/index.html)

[Basic Tutorial --- Cython 0.29.26 documentation](https://cython.readthedocs.io/en/stable/src/tutorial/cython_tutorial.html)
```python
from setuptools import setup
from Cython.Build import cythonize

setup(
    ext_modules = cythonize("primes.pyx")
)
```
```sh
python setup.py build_ext --inplace
```
<table><tr><td>

```python
def primes(int nb_primes):
    cdef int n, i, len_p
    cdef int p[1000]
    if nb_primes > 1000:
        nb_primes = 1000

    len_p = 0  # The current number of elements in p.
    n = 2
    while len_p < nb_primes:
        # Is n prime?
        for i in p[:len_p]:
            if n % i == 0:
                break

        # If no break occurred in the loop, we have a prime.
        else:
            p[len_p] = n
            len_p += 1
        n += 1

    # Let's return the result in a python list:
    result_as_list  = [prime for prime in p[:len_p]]
    return result_as_list
```
</td><td>

```python
def primes(nb_primes: cython.int):
    i: cython.int
    p: cython.int[1000]

    if nb_primes > 1000:
        nb_primes = 1000

    if not cython.compiled:  # Only if regular Python is running
        p = [0] * 1000       # Make p work almost like a C array

    len_p: cython.int = 0  # The current number of elements in p.
    n: cython.int = 2
    while len_p < nb_primes:
        # Is n prime?
        for i in p[:len_p]:
            if n % i == 0:
                break

        # If no break occurred in the loop, we have a prime.
        else:
            p[len_p] = n
            len_p += 1
        n += 1

    # Let's copy the result into a Python list:
    result_as_list = [prime for prime in p[:len_p]]
    return result_as_list
```
</td></tr></table>

纯 Python 模式是 3.0 才添加的（3.0 之前的纯 Python 模式需要 .pxd）。

[Basic Tutorial --- Cython 3.0.0a10 documentation](https://cython.readthedocs.io/en/latest/src/tutorial/cython_tutorial.html)

## C++
```python
# distutils: language=c++

from libcpp.vector cimport vector

def primes(unsigned int nb_primes):
    cdef int n, i
    cdef vector[int] p
    p.reserve(nb_primes)  # allocate memory for 'nb_primes' elements.

    n = 2
    while p.size() < nb_primes:  # size() for vectors is similar to len()
        for i in p:
            if n % i == 0:
                break
        else:
            p.push_back(n)  # push_back is similar to append()
        n += 1

    # Vectors are automatically converted to Python
    # lists when converted to Python objects.
    return p
```