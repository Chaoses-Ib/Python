# uv
[GitHub](https://github.com/astral-sh/uv)

> An extremely fast Python package installer and resolver, written in Rust. Designed as a drop-in replacement for common pip and pip-tools workflows.

- Indeed extremely fast. After I finishing the first project with uv, conda is still "Solving environment".
- `scoop install uv`

[Features | uv](https://docs.astral.sh/uv/getting-started/features/)

[Jupyter | uv](https://docs.astral.sh/uv/guides/integration/jupyter/)

How to prevent uv creating project with Python from venv/conda?
- `uv init test --python-preference only-managed` doesn't work?

[uv-interpreter](https://github.com/astral-sh/uv/tree/main/crates/uv-interpreter)
- [find\_python.rs](https://github.com/astral-sh/uv/blob/main/crates/uv-interpreter/src/find_python.rs)
- [python\_environment.rs](https://github.com/astral-sh/uv/blob/main/crates/uv-interpreter/src/python_environment.rs)

[uv-virtualenv: A rust library to create Python virtual environments](https://github.com/astral-sh/uv/tree/main/crates/uv-virtualenv)
- uv-virtualenv 主要是 uv 内部使用的，文档较少，也没有上传到 crates.io，可能会有一些潜在问题。

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