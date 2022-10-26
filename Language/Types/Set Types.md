# [Set Types](https://docs.python.org/3/library/stdtypes.html#set)
Operation | Code
--- | ---
Union | `a \| b`<br />`a.union(b)`<br />`a.update(b); a`
Intersection | `a & b`<br />`a.intersection(b)`<br />`a.intersection_update(b); a`<br />`[a.add(e) for e in b]`
Difference | `a - b`<br />`a.difference(b)`<br />`a.difference_update(b); a`<br />`[a.discard(e) for e in b]`<br />`[a.remove(e) for e in a & b]`
Symmetric difference | `a ^ b`<br />`a.symmetric_difference(b)`<br />`a.symmetric_difference_update(b); a`