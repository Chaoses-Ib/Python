# Variables
[Execution model - Python3 Docs](https://docs.python.org/3/reference/executionmodel.html)

If a name is bound in a block, it is a local variable of that block, unless declared as [`nonlocal`](https://docs.python.org/3/reference/simple_stmts.html#nonlocal) or [`global`](https://docs.python.org/3/reference/simple_stmts.html#global). If a name is bound at the module level, it is a global variable. (The variables of the module code block are local and global.) If a variable is used in a code block but not defined there, it is a *free variable*.

[python - What's the difference between globals(), locals(), and vars()? - Stack Overflow](https://stackoverflow.com/questions/7969949/whats-the-difference-between-globals-locals-and-vars)

[python - How to make a cross-module variable? - Stack Overflow](https://stackoverflow.com/questions/142545/how-to-make-a-cross-module-variable)
- `__builtins__`

## inspect
[inspect: Inspect live objects](https://docs.python.org/3/library/inspect.html)

[python - accessing the calling function's variables - Stack Overflow](https://stackoverflow.com/questions/50152084/accessing-the-calling-functions-variables)
```python
import inspect

def get_variables():
    frame = inspect.currentframe().f_back
    print(frame.f_locals)

def main():
    a = 1
    b = 'hello world'

    get_variables()

main()
# output: {'b': 'hello world', 'a': 1}
```

[python - How to deal with limitations of "inspect.getsource" - or how to get ONLY the source of a function? - Stack Overflow](https://stackoverflow.com/questions/55107168/how-to-deal-with-limitations-of-inspect-getsource-or-how-to-get-only-the-sou)

Jupyter Notebook:
- `findsource()` instead of `getsource()`.
- [Getting the source of an object defined in an iPython session. - Issue #11249 - ipython/ipython](https://github.com/ipython/ipython/issues/11249)
- [dill.source.getsource() does not return expected results in IPython terminal or Notebook - Issue #54 - uqfoundation/dill](https://github.com/uqfoundation/dill/issues/54)
- [python - Getting the source of an object defined in a Jupyter Notebook - Stack Overflow](https://stackoverflow.com/questions/51566497/getting-the-source-of-an-object-defined-in-a-jupyter-notebook)