# uv
[GitHub](https://github.com/astral-sh/uv)

> An extremely fast Python package installer and resolver, written in Rust. Designed as a drop-in replacement for common pip and pip-tools workflows.

- Indeed extremely fast. After I finishing the first project with uv, conda is still "Solving environment".
- `scoop install uv`

[Features | uv](https://docs.astral.sh/uv/getting-started/features/)

[uv-interpreter](https://github.com/astral-sh/uv/tree/main/crates/uv-interpreter)
- [find\_python.rs](https://github.com/astral-sh/uv/blob/main/crates/uv-interpreter/src/find_python.rs)
- [python\_environment.rs](https://github.com/astral-sh/uv/blob/main/crates/uv-interpreter/src/python_environment.rs)

[uv-virtualenv: A rust library to create Python virtual environments](https://github.com/astral-sh/uv/tree/main/crates/uv-virtualenv)
- uv-virtualenv 主要是 uv 内部使用的，文档较少，也没有上传到 crates.io，可能会有一些潜在问题。

## [Projects](https://docs.astral.sh/uv/concepts/projects/)
- `--vcs` defaults to `git`
  ```gitignore
  # Python-generated files
  __pycache__/
  *.py[oc]
  build/
  dist/
  wheels/
  *.egg-info

  # Virtual environments
  .venv

  ```
  [Automatic Git Repository Initialization for \`uv init\` Command - Issue #7016 - astral-sh/uv](https://github.com/astral-sh/uv/issues/7016)
- `--vcs git` will not create the repository *and `.gitignore`* if the directory is already in one

  [`uv init` fails to create .git directory or .gitignore file when inside git repo - Issue #11655 - astral-sh/uv](https://github.com/astral-sh/uv/issues/11655)
  > Regarding the default behavior, how about creating `.gitignore` but without `.git`? Currently, one has to write `.gitignore` manually if the project is inited inside an existing repo that doesn't have ignore rules for Python. If uv creates `.gitignore` by default, this can be skipped, and if someone doesn't want it they can simply remove it, much eaiser than the opposite.

### [Locking and syncing](https://docs.astral.sh/uv/concepts/projects/sync/)
[`uv.lock`](https://docs.astral.sh/uv/concepts/projects/layout/#the-lockfile)
> Unlike the `pyproject.toml`, which is used to specify the broad requirements of your project, the lockfile contains the exact resolved versions that are installed in the project environment. This file should be checked into version control, allowing for consistent and reproducible installations across machines.
>
> The lockfile is created and updated during uv invocations that use the project environment, i.e., `uv sync` and `uv run`. The lockfile may also be explicitly updated using `uv lock`.

But `uv.lock` is a bit large, it's fine to not save `uv.lock` if one doesn't care about reproducibility.

## [Virtual environments](https://docs.astral.sh/uv/pip/environments/)
[CLI](https://docs.astral.sh/uv/reference/cli/#uv-venv)
- `uv venv`
  - `uv venv --seed`

    [virtualenv - What exactly is a "seed package" in Python? - Stack Overflow](https://stackoverflow.com/questions/79053771/what-exactly-is-a-seed-package-in-python)

- Activation
  - Only `.venv` in the current directory or the direct parent directory will be used
  - [Add a command to activate the virtual environment, e.g., `uv shell` - Issue #1910 - astral-sh/uv](https://github.com/astral-sh/uv/issues/1910)

  ```sh
  # Windows
  .\.venv\Scripts\activate
  # Linux
  source .venv/bin/activate

  # To let VS Code discover the venv:
  code .
  ```

[Question: How to install local python package? - Issue #2418 - astral-sh/uv](https://github.com/astral-sh/uv/issues/2418)

## [Python versions](https://docs.astral.sh/uv/concepts/python-versions/)
- How to prevent uv creating project with Python from venv/conda?
  
  `uv init test --python-preference only-managed` doesn't work on v0.4.20, but fixed at least on v0.6.3

- Why need `.python-version` if it's already in `pyproject.toml`?

  [Docs: Mention that `.python-version` is obsolete if `project.requires-python` is present in `pyproject.toml`? - Issue #8247 - astral-sh/uv](https://github.com/astral-sh/uv/issues/8247)
  > `requires-python` is the range of versions supported by your project. `.python-version` is the exact version you want to use when developing.

  > There is a reason to have it in a separate file --- other tools can read it. For example, GitHub Actions's `setup-python` action can read a version from a `.python-file` but not from a `[tool.uv]` option.

  [Support reading Python versions from `tool.uv` - Issue #4359 - astral-sh/uv](https://github.com/astral-sh/uv/issues/4359)

  Not necessary at least on v0.6.3, which will use the latest managed version by default.

## [Jupyter](https://docs.astral.sh/uv/guides/integration/jupyter/)
- As a dependency
  ```pwsh
  uv init project
  cd project
  uv add --dev ipykernel
  code .
  ```
  Can only detect `.venv` under the root directory, not in subdirectories.
- As a tool
  ```
  uv tool run jupyter lab
  ```

How to use Jupyter in VS Code without make a project every time?

[Consider adding documentation on using `uv ...` to use a `.venv` in Jupyter notebooks - Issue #6329 - astral-sh/uv](https://github.com/astral-sh/uv/issues/6329)

## Dependencies
[Caching | uv](https://docs.astral.sh/uv/concepts/cache/)

> Disk-space efficient, with a [global cache](https://docs.astral.sh/uv/concepts/cache) for dependency deduplication.

If every new project always uses the latest version, cache doesn't make much sense. Does uv resuing old version dependencies when possible? Or upgrades for all projects?

- Hyped so much but can't just install torch...?

  [Add documentation for installing common pytorch variants - Issue #5945 - astral-sh/uv](https://github.com/astral-sh/uv/issues/5945)
  ```sh
  > uv add torch torchvision --index-url https://download.pytorch.org/whl/cu124
  × No solution found when resolving dependencies:
  ╰─▶ Because ipykernel was not found in the package registry and benches:dev depends on ipykernel>=6.29.5, we can conclude that benches:dev's requirements are unsatisfiable.
      And because your project depends on benches:dev, we can conclude that your project's requirements are unsatisfiable.
  help: If this is intentional, run `uv add --frozen` to skip the lock and sync steps.
  ```

  [Issues creating a cuda-enabled pytorch environment with UV - Issue #7202 - astral-sh/uv](https://github.com/astral-sh/uv/issues/7202)

  [torch + transitive dependency leads to unnecessary packages - Issue #8001 - astral-sh/uv](https://github.com/astral-sh/uv/issues/8001)

  [Questions: Migrating from poetry - Issue #7245 - astral-sh/uv](https://github.com/astral-sh/uv/issues/7245)

  ~~`uv pip install torch==2.4.1+cu124 --index-url https://download.pytorch.org/whl/cu124`~~

  Or is it just becuase Python 3.13 is not supported yet?

## [Tools](https://docs.astral.sh/uv/concepts/tools/)
- `uv tool run` / `uvx` / `uv run --no-project --with <name> -- <name>`
- Tools will be installed into venvs in `uv cache dir`
- How to run tool from a given venv?

  `uv pip install <name> && uv run <name>`
