# Statements
[Simple statements - Python3 Docs](https://docs.python.org/3/reference/simple_stmts.html)

## Assignment statements
```antlr
assignment_stmt ::=  (target_list "=")+ (starred_expression | yield_expression)
target_list     ::=  target ("," target)* [","]
target          ::=  identifier
                     | "(" [target_list] ")"
                     | "[" [target_list] "]"
                     | attributeref
                     | subscription
                     | slicing
                     | "*" target
```

Ignore trailing results: `a, *_ = f()`