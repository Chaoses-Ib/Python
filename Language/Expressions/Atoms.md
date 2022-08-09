# Atoms
Atoms are the most basic elements of expressions. The simplest atoms are identifiers or literals. Forms enclosed in parentheses, brackets or braces are also categorized syntactically as atoms. The syntax for atoms is:

```
atom      ::=  identifier | literal | enclosure
enclosure ::=  parenth_form | list_display | dict_display | set_display
               | generator_expression | yield_atom
```

## Displays
For constructing a list, a set or a dictionary Python provides special syntax called “displays”, each of them in two flavors:
- either the container contents are listed explicitly, or
- they are computed via a set of looping and filtering instructions, called a **comprehension**.

### Comprehensions
```
comprehension ::=  assignment_expression comp_for
comp_for      ::=  ["async"] "for" target_list "in" or_test [comp_iter]
comp_iter     ::=  comp_for | comp_if
comp_if       ::=  "if" or_test [comp_iter]
```

### List displays
```
list_display ::=  "[" [starred_list | comprehension] "]"
```

### Set displays
```
set_display ::=  "{" (starred_list | comprehension) "}"
```
An empty set cannot be constructed with `{}`; this literal constructs an empty dictionary. Use `set()` instead.

### Dictonary displays
```
dict_display       ::=  "{" [key_datum_list | dict_comprehension] "}"
key_datum_list     ::=  key_datum ("," key_datum)* [","]
key_datum          ::=  expression ":" expression | "**" or_expr
dict_comprehension ::=  expression ":" expression comp_for
```
A double asterisk `**` denotes *dictionary unpacking*. Its operand must be a [mapping](https://docs.python.org/3/glossary.html#term-mapping). Each mapping item is added to the new dictionary. Later values replace values already set by earlier key/datum pairs and earlier dictionary unpackings. (Python 3.5, [PEP 448](https://peps.python.org/pep-0448/))