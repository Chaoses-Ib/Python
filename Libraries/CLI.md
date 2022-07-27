# CLI
Library | Help message | Autocomplete | REPL | i18n
--- | --- | --- | --- | ---
[argparse](#argparse) | ✔️ | 
[getopt](#getopt) | ❌ | 
[Click](#click) | ✔️<br />[Colorful](https://github.com/click-contrib/click-help-colors) | ✔️ | ✔️[click-repl](https://github.com/click-contrib/click-repl) | ✔️
[Typer](#typer) | 2-level help<br />Colorful | ✔️ | ✔️[click-repl](https://github.com/click-contrib/click-repl) | ❌
[Python Fire](#python-fire) | 3-level help | ✔️ | Python | ❌
[docopt](#docopt) | ✔️ | ✔️[docopt-completion](https://github.com/Infinidat/infi.docopt_completion/) | ❌ | ❌

## Tranditional
### [argparse](https://docs.python.org/3/library/argparse.html)
The following code is a program that takes a list of integers and produces either the sum or the max:
```python
import argparse

parser = argparse.ArgumentParser(description='Process some integers.')
parser.add_argument('integers', metavar='N', type=int, nargs='+',
                    help='an integer for the accumulator')
parser.add_argument('--sum', dest='accumulate', action='store_const',
                    const=sum, default=max,
                    help='sum the integers (default: find the max)')

args = parser.parse_args()
print(args.accumulate(args.integers))
```

Help message:
```
usage: prog.py [-h] [--sum] N [N ...]

Process some integers.

positional arguments:
 N           an integer for the accumulator

options:
 -h, --help  show this help message and exit
 --sum       sum the integers (default: find the max)
```

### [getopt](https://docs.python.org/3/library/getopt.html)
getopt supports the same conventions as the Unix `getopt()` function. Example:
```python
import getopt, sys

def main():
    try:
        opts, args = getopt.getopt(sys.argv[1:], "ho:v", ["help", "output="])
    except getopt.GetoptError as err:
        # print help information and exit:
        print(err)  # will print something like "option -a not recognized"
        usage()
        sys.exit(2)
    output = None
    verbose = False
    for o, a in opts:
        if o == "-v":
            verbose = True
        elif o in ("-h", "--help"):
            usage()
            sys.exit()
        elif o in ("-o", "--output"):
            output = a
        else:
            assert False, "unhandled option"
    # ...

if __name__ == "__main__":
    main()
```

## Decorator-based
### [Click](https://click.palletsprojects.com/)
[pallets/click](https://github.com/pallets/click)

Example:
```python
import click

@click.command()
@click.option('--count', default=1, help='Number of greetings.')
@click.option('--name', prompt='Your name',
              help='The person to greet.')
def hello(count, name):
    """Simple program that greets NAME for a total of COUNT times."""
    for x in range(count):
        click.echo(f"Hello {name}!")

if __name__ == '__main__':
    hello()
```

Help message:
```
Usage: hello.py [OPTIONS]

  Simple program that greets NAME for a total of COUNT times.

Options:
  --count INTEGER  Number of greetings.
  --name TEXT      The person to greet.
  --help           Show this message and exit.
```

### [Typer](https://typer.tiangolo.com/)
[tiangolo/typer](https://github.com/tiangolo/typer)  
Based on [Click](#click).

Example:
```python
import typer

app = typer.Typer()

@app.command()
def hello(name: str):
    print(f"Hello {name}")

@app.command()
def goodbye(name: str, formal: bool = False):
    if formal:
        print(f"Goodbye Ms. {name}. Have a good day.")
    else:
        print(f"Bye {name}!")

if __name__ == "__main__":
    app()
```

Help message (colorful):
```
$ python main.py --help

 Usage: main.py [OPTIONS] COMMAND [ARGS]...          
                                                     
╭─ Options ─────────────────────────────────────────╮
│ --install-completion          Install completion  │
│                               for the current     │
│                               shell.              │
│ --show-completion             Show completion for │
│                               the current shell,  │
│                               to copy it or       │
│                               customize the       │
│                               installation.       │
│ --help                        Show this message   │
│                               and exit.           │
╰───────────────────────────────────────────────────╯
╭─ Commands ────────────────────────────────────────╮
│ goodbye                                           │
│ hello                                             │
╰───────────────────────────────────────────────────╯

```
```
$ python main.py hello --help

 Usage: main.py goodbye [OPTIONS] NAME               
                                                     
╭─ Arguments ───────────────────────────────────────╮
│ *    name      TEXT  [default: None] [required]   │
╰───────────────────────────────────────────────────╯
╭─ Options ─────────────────────────────────────────╮
│ --formal    --no-formal      [default: no-formal] │
│ --help                       Show this message    │
│                              and exit.            │
╰───────────────────────────────────────────────────╯

```

### [Python Fire](https://github.com/google/python-fire/)
Example:
```python
import fire

class BrokenCalculator(object):

  def __init__(self, offset=1):
      self._offset = offset

  def add(self, x, y):
    return x + y + self._offset

  def multiply(self, x, y):
    return x * y + self._offset

if __name__ == '__main__':
  fire.Fire(BrokenCalculator)
```

Help message:
```
$ python main.py --help
INFO: Showing help with the command 'main.py -- --help'.

NAME
    main.py

SYNOPSIS
    main.py <flags>

FLAGS
    --offset=OFFSET
        Default: 1
```
```
$ python main.py - --help
INFO: Showing help with the command 'test2.py - -- --help'.

NAME
    test2.py

SYNOPSIS
    test2.py - COMMAND

COMMANDS
    COMMAND is one of the following:

     add

     multiply
```
```
$ python main.py add --help
INFO: Showing help with the command 'test2.py add -- --help'.

NAME
    test2.py add

SYNOPSIS
    test2.py add X Y

POSITIONAL ARGUMENTS
    X
    Y

NOTES
    You can also use flags syntax for POSITIONAL ARGUMENTS
```

## Formal-language-based
### [docopt](https://github.com/docopt/docopt)
Example:
```python
"""Naval Fate.

Usage:
  naval_fate.py ship new <name>...
  naval_fate.py ship <name> move <x> <y> [--speed=<kn>]
  naval_fate.py ship shoot <x> <y>
  naval_fate.py mine (set|remove) <x> <y> [--moored | --drifting]
  naval_fate.py (-h | --help)
  naval_fate.py --version

Options:
  -h --help     Show this screen.
  --version     Show version.
  --speed=<kn>  Speed in knots [default: 10].
  --moored      Moored (anchored) mine.
  --drifting    Drifting mine.

"""
from docopt import docopt


if __name__ == '__main__':
    arguments = docopt(__doc__, version='Naval Fate 2.0')
    print(arguments)
    """
    $ naval_fate.py ship Guardian move 100 150 --speed=15
    {'--drifting': False,    'mine': False,
     '--help': False,        'move': True,
     '--moored': False,      'new': False,
     '--speed': '15',        'remove': False,
     '--version': False,     'set': False,
     '<name>': ['Guardian'], 'ship': True,
     '<x>': '100',           'shoot': False,
     '<y>': '150'}
    """
```