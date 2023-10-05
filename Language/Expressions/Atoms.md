# Atoms
Atoms are the most basic elements of expressions. The simplest atoms are identifiers or literals. Forms enclosed in parentheses, brackets or braces are also categorized syntactically as atoms. The syntax for atoms is:

```
atom      ::=  identifier | literal | enclosure
enclosure ::=  parenth_form | list_display | dict_display | set_display
               | generator_expression | yield_atom
```

## [→Identifiers](https://github.com/Chaoses-Ib/FormalLanguages/blob/main/Program/Identifers.md#languages)
[Python 3: How to check if a string can be a valid variable? - Stack Overflow](https://stackoverflow.com/questions/49331782/python-3-how-to-check-if-a-string-can-be-a-valid-variable)
- [`str.isidentifier`](https://docs.python.org/3.3/library/stdtypes.html#str.isidentifier)

  A keyword is considered a valid identifier.

Normalize strings to ids:
```python
import re
import keyword

def is_xid_start(s: str) -> bool:
    return s.isidentifier()

def is_xid_continue(s: str) -> bool:
    return f'_{s}'.isidentifier()

def str_to_raw_id(s: str) -> str:
    s = s.lstrip()
    assert s != ''

    if s.isascii():
        s = re.sub(r'[^A-Za-z_0-9]', '_', s)
        s = re.sub(r'^[0-9]', r'_\0', s, count=1)
    else:
        s = re.sub(r'[\S\s]', lambda m: m.group(0) if is_xid_continue(m.group(0)) else '_', s)
        if not is_xid_start(s[0]):
            s = f'_{s}'
    s = re.sub(r'__+', '_', s)
    s = s.rstrip('_')
    
    if keyword.iskeyword(s):
        s += '_'
    
    return s

def id_to_lower(id: str) -> str:
    return re.sub(r'([a-z])([A-Z])', r'\1_\2', id).lower()

def id_to_camel(id: str) -> str:
    return re.sub(r'_([a-zA-Z])', lambda m: m.group(1).upper(), id)

def id_to_upper(id: str) -> str:
    return re.sub(r'([a-z])([A-Z])', r'\1_\2', id).upper()

def str_to_mod_id(s: str) -> str:
    return id_to_lower(str_to_raw_id(s))

def str_to_func_id(s: str) -> str:
    return id_to_lower(str_to_raw_id(s))

def str_to_var_id(s: str) -> str:
    id = id_to_lower(str_to_raw_id(s))
    if id == 'i':
        return 'L'
    return id

def str_to_class_id(s: str) -> str:
    return id_to_camel(str_to_raw_id(s))

def str_to_const_id(s: str) -> str:
    return id_to_upper(str_to_raw_id(s))

__all__ = [
    # 'is_xid_start',
    # 'is_xid_continue',
    # 'str_to_raw_id',
    # 'id_to_lower',
    # 'id_to_camel',
    # 'id_to_upper',
    'str_to_mod_id',
    'str_to_func_id',
    'str_to_var_id',
    'str_to_class_id',
    'str_to_const_id',
]
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