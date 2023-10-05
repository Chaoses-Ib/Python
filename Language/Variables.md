# Variables
[Execution model - Python3 Docs](https://docs.python.org/3/reference/executionmodel.html)

If a name is bound in a block, it is a local variable of that block, unless declared as [`nonlocal`](https://docs.python.org/3/reference/simple_stmts.html#nonlocal) or [`global`](https://docs.python.org/3/reference/simple_stmts.html#global). If a name is bound at the module level, it is a global variable. (The variables of the module code block are local and global.) If a variable is used in a code block but not defined there, it is a *free variable*.

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