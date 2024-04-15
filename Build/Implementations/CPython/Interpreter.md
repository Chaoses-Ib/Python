## Interpreter
[2\. Using the Python Interpreter --- Python 3 documentation](https://docs.python.org/3/tutorial/interpreter.html)

[16\. Appendix --- Python 3 documentation](https://docs.python.org/3/tutorial/appendix.html#interactive-mode)

## Command line
[1\. Command line and environment --- Python 3 documentation](https://docs.python.org/3/using/cmdline.html#using-on-general)

## Exit
- Ctrl+D（Ctrl+Z）
- `quit()`
- `exit()`

## GNU Readline
`~/.python_history`

## WSL1
```
whereis python3
python3: /usr/bin/python3 /usr/bin/python3.8 /usr/bin/python3.8-config /usr/lib/python3 /usr/lib/python3.8 /usr/lib/python3.9 /etc/python3 /etc/python3.8 /usr/local/lib/python3.8 /usr/include/python3.8 /usr/share/python3 /mnt/c/ProgramData/Miniconda3/python3.dll /mnt/c/ProgramData/Miniconda3/python39.dll /mnt/c/ProgramData/Miniconda3/python39.pdb /mnt/c/Users/混沌/AppData/Local/Microsoft/WindowsApps/python3.exe /usr/share/man/man1/python3.1.gz
```

## 切换到 REPL
```python
import code
code.interact(local=locals())
```
[interactive - How to drop into REPL (Read, Eval, Print, Loop) from Python code - Stack Overflow](https://stackoverflow.com/questions/1395913/how-to-drop-into-repl-read-eval-print-loop-from-python-code)