# File Systems
## Links
### NTFS junction points
The [os.lstat()](https://docs.python.org/3/library/os.html#os.lstat) implementation only sets `S_IFLNK` for symbolic links and not for [NTFS Junction points](https://en.wikipedia.org/wiki/NTFS_links). This can lead to many problems:
- [os.path.islink()](https://docs.python.org/3/library/os.path.html#os.path.islink) will return *False* for junctions.
- [os.readlink()](https://docs.python.org/3/library/os.html#os.readlink) will read junctions however.
- By default, [os.walk()](https://docs.python.org/3/library/os.html#os.walk) will not walk down into symbolic links that resolve to directories, *however*, it will walk down into junctions. ([Issue #67596](https://github.com/python/cpython/issues/67596))
  - [Windows Junctions inside the Recycle Bin are being followed through under certain circumstances. · Issue #668 · bleachbit/bleachbit](https://github.com/bleachbit/bleachbit/issues/668)
    - [记一次由Windows文件错误递归删除引起的重大事故，以及对使用Win的Linux爱好者的忠告 - 小众软件官方论坛](https://meta.appinn.net/t/topic/35095)