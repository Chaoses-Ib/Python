#import "@local/ib:0.1.0": *
#title[Cython Build]
#a[Source Files and Compilation --- Cython documentation][https://cython.readthedocs.io/en/latest/src/userguide/source_files_and_compilation.html]

#a["Modern" way to build packages with C (Cython) extensions - Packaging - Discussions on Python.org][https://discuss.python.org/t/modern-way-to-build-packages-with-c-cython-extensions/15050]

= CPython
- CPython $>=$ 3.9
  #footnote[#a[Remove support for Python 3.8 in Cython 3.3 - Issue \#7271 - cython/cython][https://github.com/cython/cython/issues/7271]]

- Needs a Python distribution with `include`
  #footnote[#a[How to fix Cython header error when compiling python script to C - Stack Overflow][https://stackoverflow.com/questions/55527377/how-to-fix-cython-header-error-when-compiling-python-script-to-c]]
  #footnote[#a[Cython cannot use "pycore_frame.h" in Py3.14a4 - Issue \#130931 - python/cpython][https://github.com/python/cpython/issues/130931]]
  and `libs`
  #footnote[#a[[Solved] Linking problem while compiling Cython module in command prompt with Panda3D 1.10-x64 on Windows 10 - C++ coding using Panda3D - Panda3D][https://discourse.panda3d.org/t/solved-linking-problem-while-compiling-cython-module-in-command-prompt-with-panda3d-1-10-x64-on-windows-10/24328]]
  .

- Cannot directly build for other versions?
  #footnote[#a[Building c-extension wheels for multiple python versions - Issue \#268 - pypa/build][https://github.com/pypa/build/issues/268]]
  #footnote[#a[How to build a compiled module for multiple Python versions and platforms - Stack Overflow][https://stackoverflow.com/questions/49279328/how-to-build-a-compiled-module-for-multiple-python-versions-and-platforms]]
  - `language_level=2|3`
    #footnote[#a[What does `language_level` in `setup.py` for cython do? - Stack Overflow][https://stackoverflow.com/questions/54900723/what-does-language-level-in-setup-py-for-cython-do]]

- #a[The Limited API and Stable ABI][https://cython.readthedocs.io/en/latest/src/userguide/limited_api.html]
  #footnote[#a[[ENH] Provide a "compatibility over performance" C compile mode for CPython - Issue \#5249 - cython/cython][https://github.com/cython/cython/issues/5249]]

= MSVC
#a[WindowsCompilers][https://wiki.python.org/moin/WindowsCompilers]
#footnote[#a[python - Error "Microsoft Visual C++ 14.0 is required (Unable to find vcvarsall.bat)" - Stack Overflow][https://stackoverflow.com/questions/29846087/error-microsoft-visual-c-14-0-is-required-unable-to-find-vcvarsall-bat]]
#footnote[#a[Cython problem (need Microsoft Visual C++ 14?) - Python Help - Discussions on Python.org][https://discuss.python.org/t/cython-problem-need-microsoft-visual-c-14/75133]]

```sh
Compiling a.py because it changed.
[1/1] Cythonizing a.py
running build_ext
building 'a' extension
error: Microsoft Visual C++ 14.0 or greater is required. Get it with "Microsoft C++ Build Tools": https://visualstudio.microsoft.com/visual-cpp-build-tools/
```

- Linux
  - Cannot cross-compile easily.
    #footnote[#a[python - Cross-compile extension on Linux for Windows - Stack Overflow][https://stackoverflow.com/questions/48518055/cross-compile-extension-on-linux-for-windows]]
    #footnote[#a[How to cross-compile a Cython library? : r/learnpython][https://www.reddit.com/r/learnpython/comments/1c0g74p/how_to_crosscompile_a_cython_library/]]
    #footnote[#a[[FR] add support for cross-compiling of CPython and Cython modules using setuptools - Issue \#2679 - pypa/setuptools][https://github.com/pypa/setuptools/issues/2679]]
  - Works with #a[msvc-wine][https://github.com/Chaoses-Ib/Cpp/blob/main/Build/Build%20Systems/MSBuild/Linux.typ#L6].
    #footnote[#a[Suggestion : Mock a valid visual-cpp-build-tools environment under wine - Issue \#176 - mstorsjo/msvc-wine][https://github.com/mstorsjo/msvc-wine/issues/176]]

    #q-i[I can confirm it works after calling `vcvars64.bat` and `set DISTUTILS_USE_SDK=1`.
    I believe if there is a dummy `vswhere.exe`, it will just work out of the box, though it feels not trivial to implement it...]
  
- Set `DISTUTILS_USE_SDK=1`
  to force using existing envrionment variables
  (instead of running ```cmd cmd /u /c vcvarsall.bat```).
  #footnote[#a[`setuptools/setuptools/_distutils/compilers/C/msvc.py` at 5a13876673a41e3cd21d4d6e587f53d0fb4fd8e5 - pypa/setuptools][https://github.com/pypa/setuptools/blob/5a13876673a41e3cd21d4d6e587f53d0fb4fd8e5/setuptools/_distutils/compilers/C/msvc.py#L150]]

= Debugging
#a[DebuggingTechniques - cython Wiki][https://github.com/cython/cython/wiki/DebuggingTechniques]

#a[Debugging your Cython program --- Cython documentation][https://docs.cython.org/en/latest/src/userguide/debugging.html]

MSVC:
```py
EXT_MODULES = cythonize([       
    Extension("_winhttp", ["_winhttp.pyx"],
              extra_compile_args=["-Ox", "-Zi"],
              extra_link_args=["-debug:full"])
], emit_linenums=True)
```
#a[Debugging Cython with WinDBG | Steve Dower][https://stevedower.id.au/blog/debugging-cython-with-windbg]

= CLI
- Output directories
  #footnote[#a[python - Specify Cython output file - Stack Overflow][https://stackoverflow.com/questions/34344934/specify-cython-output-file]]
  - `python setup.py build_ext --build-lib lib` (instead of `build/lib.win-amd64-cpython-314`)
  - ```py
    ext_modules = cythonize([
        Extension(r"testm", [r"testm.py"],
            extra_compile_args=['-Zi'],
            extra_link_args=['-debug:full']
        ),
    ], build_dir='c')
    setup(
        ext_modules=ext_modules
    )
    ```
