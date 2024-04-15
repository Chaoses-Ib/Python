# Decompilers
## uncompyle6
[rocky/python-uncompyle6: A cross-version Python bytecode decompiler](https://github.com/rocky/python-uncompyle6)

现在还不支持 Python 3.9，不过改掉检测测试能正常使用。

[AttributeError: module 'xdis.opcodes.opcode\_39' has no attribute 'END\_FINALLY' - Issue #355 - rocky/python-uncompyle6](https://github.com/rocky/python-uncompyle6/issues/355)

部分情况会出错，还是老老实实用 3.8 吧。

不支持 3.9 指的是不支持反编译 3.9 pyc。

改了下 `uncompile.py/main_bin`，还是不能用，我当时的意思是切换 3.8 也用不了？

那 3.9 pyc 目前就是最简单的防反编译了。

## Python 版本问题
- 直接改 magic number

  [pytype/magic.py at master - google/pytype](https://github.com/google/pytype/blob/master/pytype/pyc/magic.py)

- [zrax/pycdc: C++ python bytecode disassembler and decompiler](https://github.com/zrax/pycdc)

  pycdc 直接崩了，pycdas 倒是可以用，比 dis 稍微强一点。

- dis
  
  ```python
  import dis, marshal, sys

  header_sizes = [
      # (size, first version this applies to)
      # pyc files were introduced in 0.9.2 way, way back in June 1991.
      (8,  (0, 9, 2)),  # 2 bytes magic number, \r\n, 4 bytes UNIX timestamp
      (12, (3, 6)),     # added 4 bytes file size
      # bytes 4-8 are flags, meaning of 9-16 depends on what flags are set
      # bit 0 not set: 9-12 timestamp, 13-16 file size
      # bit 0 set: 9-16 file hash (SipHash-2-4, k0 = 4 bytes of the file, k1 = 0)
      (16, (3, 7)),     # inserted 4 bytes bit flag field at 4-8 
      # future version may add more bytes still, at which point we can extend
      # this table. It is correct for Python versions up to 3.9
  ]
  header_size = next(s for s, v in reversed(header_sizes) if sys.version_info >= v)

  with open(pycfile, "rb") as f:
      metadata = f.read(header_size)  # first header_size bytes are metadata
      code = marshal.load(f)          # rest is a marshalled code object

  dis.dis(code)
  ```

[python - How can I understand a .pyc file content - Stack Overflow](https://stackoverflow.com/questions/32562163/how-can-i-understand-a-pyc-file-content)