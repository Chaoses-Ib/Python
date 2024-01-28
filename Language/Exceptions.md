# Exceptions
[Execution model - Python3 Docs](https://docs.python.org/3/reference/executionmodel.html#exceptions)

[python - How to catch multiple exceptions in one line? (in the "except" block) - Stack Overflow](https://stackoverflow.com/questions/6470428/how-to-catch-multiple-exceptions-in-one-line-in-the-except-block)

[Catch exception and continue try block in Python - Stack Overflow](https://stackoverflow.com/questions/19522990/catch-exception-and-continue-try-block-in-python)

## traceback
[traceback --- Print or retrieve a stack traceback - Python3 Docs](https://docs.python.org/3/library/traceback.html)

```python
import traceback
try:
    raise Exception('test')
except Exception:
    traceback.print_exc()
    r'''
    Traceback (most recent call last):
      File "C:\test.py", line 3, in <cell line: 2>
        raise Exception('test')
    Exception: test
    '''
```

[Catch and print full Python exception traceback without halting/exiting the program - Stack Overflow](https://stackoverflow.com/questions/3702675/catch-and-print-full-python-exception-traceback-without-halting-exiting-the-prog)