# JSON
- [json: JSON encoder and decoder](https://docs.python.org/3/library/json.html)

- [jsons: 🐍 A Python lib for (de)serializing Python objects to/from JSON](https://github.com/ramonhagenaars/jsons)

- [jsonpickle: Python library for serializing any arbitrary object graph into JSON. It can take almost any Python object and turn the object into JSON. Additionally, it can reconstitute the object back into Python.](https://github.com/jsonpickle/jsonpickle)
  - [jsonstruct](https://github.com/initialxy/jsonstruct)

## Objects
[How to convert JSON data into a Python object? - Stack Overflow](https://stackoverflow.com/questions/6578986/how-to-convert-json-data-into-a-python-object)

```python
import json
from types import SimpleNamespace

data = '{"name": "John Smith", "hometown": {"name": "New York", "id": 123}, "0": 1}'

x = json.loads(data, object_hook=lambda d: SimpleNamespace(**d))
print(x.name, x.hometown.name, x.hometown.id, x.__dict__['0'])
```

Note that [`SimpleNamespace`](https://docs.python.org/3/library/types.html#types.SimpleNamespace) is unhashable.