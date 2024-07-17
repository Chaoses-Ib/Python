# TUI
## Progress bars
- [tqdm: :zap: A Fast, Extensible Progress Bar for Python and CLI](https://github.com/tqdm/tqdm)

  - Support nested progress bars.
    - [Double Progress Bar in Python - Stack Overflow](https://stackoverflow.com/questions/23113494/double-progress-bar-in-python)

  - Jupyter
    - `pip install tqdm[notebook]`
    - `from tqdm.auto import tqdm` / `from tqdm.autonotebook import tqdm` / `from tqdm.notebook import tqdm`

  - `update()` is incremental.
  
    A workaround is to use `pbar.update(value - pbar.n)`

  - [Question about control sequence and thread-safe update without lock - Issue #430](https://github.com/tqdm/tqdm/issues/430)

  - [Use Windows 7 taskbar API to show progress - Issue #442](https://github.com/tqdm/tqdm/issues/442)

  - Downloading
  
    [Progress Bar while download file over http with Requests - Stack Overflow](https://stackoverflow.com/questions/37573483/progress-bar-while-download-file-over-http-with-requests)

    [requests download file with a tqdm progress bar](https://gist.github.com/yanqd0/c13ed29e29432e3cf3e7c38467f42f51)

- `print()`

  ```python
  def _print_progress(iteration, total, prefix = '', suffix = '', decimals = 0, length = 50, fill = '█', printEnd = '\r'):
      """
      Call in a loop to create terminal progress bar
      @params:
          iteration   - Required  : current iteration (Int)
          total       - Required  : total iterations (Int)
          prefix      - Optional  : prefix string (Str)
          suffix      - Optional  : suffix string (Str)
          decimals    - Optional  : positive number of decimals in percent complete (Int)
          length      - Optional  : character length of bar (Int)
          fill        - Optional  : bar fill character (Str)
          printEnd    - Optional  : end character (e.g. "\r", "\r\n") (Str)
      
      From https://stackoverflow.com/questions/3173320/text-progress-bar-in-terminal-with-block-characters
      """
      percent = ("{0:3." + str(decimals) + "f}").format(100 * (iteration / float(total)))
      filledLength = int(length * iteration // total)
      bar = fill * filledLength + '-' * (length - filledLength)
      print(f'\r{prefix}{percent}%|{bar}| {iteration}/{total}{suffix}', end = printEnd)
      # Print New Line on Complete
      if iteration == total: 
          print()
  ```