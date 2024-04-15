# Reverse Engineering
静态：
- `Python.h`
  - IDA 解析
  - 从 PDB 导出
- Cython 生成参考 .c
- [ ] BinDiff

动态：
- 运行后 dir dump

  ```python
  import mathon

  for name in dir(mathon):
      print(f'{name} = {mathon.__dict__[name]}')
  ```
  可通过 `del` 防御

- 对象 dump

- [ ] CPython API hook

  同样可用于 pyc 混淆逆向

  为了得到更好的输出，还需要个优化器

可通过交叉使用 C 和 Python 防御

[Cython Reverse - Pandaos's blog](https://panda0s.top/2021/05/07/Cython-Reverse/)

[\[原创\]python编译后的pyd爆破-软件逆向-看雪论坛-安全社区|安全招聘|bbs.pediy.com](https://bbs.pediy.com/thread-259124.htm)

## Module 执行入口
导出函数：`PyInit_模块名`
```c
__int64 PyInit_test()
{
  return PyModuleDef_Init(&_pyx_moduledef);
}
```
`PyModuleDef` 结构中，模块名后略过两个值就是 `methods` 和 `moduledef_slots`，slots 2 对应的就是 module 的执行入口。

## 经验
- Cython 的整体特点是分支、检查很多，代码密度很低，十几行到几百行才能对应 Python 一行代码

- `import *` 需要一段约两百行的遍历过程

- 常量

  所有的常量都会被构造为对象，可以通过 `PyLong_FromLong` 等构造函数得知常量对象的值

- 变量

  获取
  - 一个变量可能会经常被重复获取
  - `_Pyx__GetModuleGlobalName`
    - `_PyDict_GetItem_KnownHash`
    - `_Pyx_GetBuiltinName`
  - `_Pyx_GetBuiltinName`
    - `PyObject_GetAttr`
    - `"name '%U' is not defined"`

  赋值
  - `PyDict_SetItem`

  变量复用问题

- 参数获取
  - `_PyDict_GetItem_KnownHash`
  - `_Pyx_ParseOptionalKeywords_constprop_27`
    - `PyDict_Next`
    - `"%.200s() keywords must be strings"`

- 调用函数

  调用一个函数时可能发生分支，有多种调用方法，可以选择最简单的一种用来逆向

  - `_Pyx_PyObject_Call_constprop_30`
    - `PyObject_Call`
    - `" while calling a Python object"、"NULL result without error in PyObject_Call"`

  - `_Pyx_PyObject_CallMethO`
    - `_Pyx_PyObject_Call_constprop_30`
    - `" while calling a Python object"、"NULL result without error in PyObject_Call"`

  - `_Pyx_PyObject_CallOneArg`
  - `_Pyx_PyObject_Call2Args`

- 算数运算

  - 加
    - `PyNumber_Add`
    - `_Pyx_PyInt_AddObjC_isra_10_constprop_32`
      - `PyNumber_Add`
  - 减
    - `PyNumber_Subtract`
    - `_Pyx_PyInt_SubtractObjC_isra_9_constprop_33`
      - `PyNumber_Subtract`
  - 乘
    - `PyNumber_Multiply`
  - 整除
    - `PyNumber_FloorDivide`

- 逻辑运算
  - 比较
    - `PyObject_RichCompare`

      `Py_LT`,` Py_LE`,` Py_EQ`,` Py_NE`,` Py_GT`, or `Py_GE`

      比较后通常会调用 `_Pyx_PyObject_IsTrue` 进行判断

    - `_Pyx_PyObject_IsTrue`
      - `PyObject_IsTrue`