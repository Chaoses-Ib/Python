# Callable Types
[Callable types](https://docs.python.org/3/reference/datamodel.html#callable-types)
- User-defined functions
- Instance methods
- Generator functions
- Coroutine functions
- Asynchronous generator functions
- Built-in functions
- Built-in methods
- Classes
- Class instances

[Calls](https://docs.python.org/3/reference/expressions.html#calls)

[python - Function closure vs. callable class - Stack Overflow](https://stackoverflow.com/questions/8966785/function-closure-vs-callable-class)

[makefun](https://smarie.github.io/python-makefun/) ([GitHub](https://github.com/smarie/python-makefun))

## Functions
[Function definitions](https://docs.python.org/3/reference/compound_stmts.html#function-definitions)
```antlr
funcdef                   ::=  [decorators] "def" funcname [type_params] "(" [parameter_list] ")"
                               ["->" expression] ":" suite
decorators                ::=  decorator+
decorator                 ::=  "@" assignment_expression NEWLINE
parameter_list            ::=  defparameter ("," defparameter)* "," "/" ["," [parameter_list_no_posonly]]
                                 | parameter_list_no_posonly
parameter_list_no_posonly ::=  defparameter ("," defparameter)* ["," [parameter_list_starargs]]
                               | parameter_list_starargs
parameter_list_starargs   ::=  "*" [parameter] ("," defparameter)* ["," ["**" parameter [","]]]
                               | "**" parameter [","]
parameter                 ::=  identifier [":" expression]
defparameter              ::=  parameter ["=" expression]
funcname                  ::=  identifier
```

[Defining Functions](https://docs.python.org/3/tutorial/controlflow.html#defining-functions)

[closures - Python lambda's binding to local values - Stack Overflow](https://stackoverflow.com/questions/10452770/python-lambdas-binding-to-local-values)
- [functools.partial()](https://docs.python.org/3/library/functools.html#functools.partial)

[Python dynamic function creation with custom names - Stack Overflow](https://stackoverflow.com/questions/13184281/python-dynamic-function-creation-with-custom-names)

[How to get function object inside a function (Python) - Stack Overflow](https://stackoverflow.com/questions/24250118/how-to-get-function-object-inside-a-function-python)