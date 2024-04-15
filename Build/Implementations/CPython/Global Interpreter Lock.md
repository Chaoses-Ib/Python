# Global Interpreter Lock
臭名昭著

[multithreading - Python threading. How do I lock a thread? - Stack Overflow](https://stackoverflow.com/questions/10525185/python-threading-how-do-i-lock-a-thread)

## Lv. 1
[GlobalInterpreterLock - Python Wiki](https://wiki.python.org/moin/GlobalInterpreterLock)

之所以需要 GIL，是因为 CPython 的内存管理不是线程安全的。

[What Is the Python Global Interpreter Lock (GIL)? -- Real Python](https://realpython.com/python-gil/)

refcount → 需要 lock
- 为什么？原子操作不就行了吗？

  [Python's GIL and atomic reference counting - Christian Aichinger's posts](https://www.caichinger.com/blog/2015/05/23/python_atomic_refcounting_slowdown/)

  原子 refcount 会导致性能降低 ~23%

  (refcount 已经消耗了 CPython 5~10% 的性能)

→ 多 lock 可能会引发死锁，还会降低性能
- 为什么会死锁？还是说只是难维护？

→ 单 lock 可以避免死锁，但会降低多线程性能

> The GIL is a single lock on the interpreter itself which adds a rule that execution of any Python bytecode requires acquiring the interpreter lock.
- 以行为单位还是以字节码为单位？

  以字节码的话，怎么保证 `i = i + 1` 是线程安全的？还是不保证？

GIL 虽然极大削弱了多线程性能，但也让开发变得简单。

许多模块的实现都依赖 GIL 的存在，想要在不破坏兼容性的情况下移除 GIL 很困难。

BDFL 还要求新方案必须不能降低单线程性能——但 Python 单线程的性能都已经低到这种程度了，还在乎 GC 的开销干嘛？

不过，反正单线程性能都这么低了，多线程高不高也无所谓了，不如专精快速开发，搞得简单点算了。

[重新认识Python（3）：GIL，Global Interpreter Lock - 知乎](https://zhuanlan.zhihu.com/p/351355024)
> GIL 从 1992 年诞生到现在，其实经历一些变化。在 GIL 被设计的年代，多核 CPU 基本不存在，当时的线程也主要是用来做 IO 类型的工作，所以 GIL 的设计处理多线程 IO 效率非常高。
GIL 的存在也让 Python 的单核性能大大增加，其实 GIL 是 Python 成功的一个重要原因。后来 GIL 加入了 switch_condition, switch_number, timeout 等参数，很大程度改善了多核处理下 GIL 线程 schedule 的问题。Python3 以后的 GIL 仍然无法实现真正的 CPU 密集并行的多线程。不过这里说的线程都是 OS 线程，这不妨碍实现软件线程。

[Python stands to lose its GIL, and gain a lot of speed | InfoWorld](https://www.infoworld.com/article/3637073/python-stands-to-lose-its-gil-and-gain-a-lot-of-speed.html)

### 缓解方案
- 多进程
- C 扩展库
- 其它 Python 实现

## Lv. 2
[Grok the GIL: How to write fast and thread-safe Python | Opensource.com](https://opensource.com/article/17/4/grok-gil)
```c
static PyThread_type_lock interpreter_lock = 0; /* This is the GIL */
```
万恶之源

```c
/* s.connect((host, port)) method */
static PyObject *
sock_connect(PySocketSockObject *s, PyObject *addro)
{
    sock_addr_t addrbuf;
    int addrlen;
    int res;

    /* convert (host, port) tuple to C address */
    getsockaddrarg(s, addro, SAS2SA(&addrbuf), &addrlen);

    Py_BEGIN_ALLOW_THREADS  //PyThread_release_lock(interpreter_lock);
    res = connect(s->sock_fd, addr, addrlen);
    Py_END_ALLOW_THREADS

    /* error handling and so on .... */
}
```
I/O 操作会先让出 GIL

`PyEval_EvalFrameEx`：
```c
for (;;) {
    if (--ticker < 0) {
        ticker = check_interval;
   
        /* Give another thread a chance */
        PyThread_release_lock(interpreter_lock);
   
        /* Other threads may run now */
   
        PyThread_acquire_lock(interpreter_lock, 1);
    }

    bytecode = *next_instr++;
    switch (bytecode) {
        /* execute the next instruction ... */
    }
}
```
CPython 2 每执行 1000 字节码就释放一次 GIL，防止 I/O 饿死，CPython 3 则是每 15ms 释放一次，更为合理。

GIL 是以字节码为单位的，判断一个操作是不是原子的要看它的字节码。

`n += 1` 的字节码是：
```
LOAD_GLOBAL              0 (n)
LOAD_CONST               1 (1)
INPLACE_ADD
STORE_GLOBAL             0 (n)
```
显然，不是原子的；

而 `sort()` 的字节码是：
```
LOAD_GLOBAL              0 (lst)
LOAD_ATTR                1 (sort)
CALL_FUNCTION            0
```
`sort` 是 built-in function，所以这里的 `CALL_FUNCTION` 是原子的。

因为 Python 的字节码不是稳定的，所以最好的写法是一律假设不原子，一律加锁。

反正 Python 有 GIL，你加锁也不会降低多线程性能，只是让别的线程等等。

Python 并发不并行，多进程快于多线程，原子操作没个谱。