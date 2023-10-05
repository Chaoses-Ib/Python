# Callable Types
[Callable types](https://docs.python.org/3/reference/datamodel.html#callable-types)

[Calls](https://docs.python.org/3/reference/expressions.html#calls)

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