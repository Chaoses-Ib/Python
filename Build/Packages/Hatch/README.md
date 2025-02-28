# Hatch
[Show HN: Hatch 1.0.0 -- Modern, extensible Python project management | Hacker News](https://news.ycombinator.com/item?id=31190027)

> From what I understand, Hatch fixes a core failure of Poetry & PDM: if you have a tool that is not a library (say Black), it should not be able to collide with another tool you are using (say TensorFlow). For a while, black and TensorFlow could not be installed in the same environment due to bad upper caps (In Python, never upper cap without proof it fails or will fail, see <https://iscinumpy.dev/post/bound-version-constraints/>) - and that's fine, TensorFlow and Black don't use each other. But Poetry/PDM will fail (and this is why Poetry's solve times can be insane). Hypermodern-python still tries to jam everything into a massive Poetry dev environment, which can create multi-hour solves if you add things like TensorFlow.
> 
> Today we've been "fixing" this by using nox or tox, and avoiding adding everything into a big "dev" environment. But the draw of Poetry/PDM was supposed to be "A single tool". Very excited to see where this goes! I've already enjoyed hatchling, which can be used on it's own with other systems. :) (Except Poetry, which doesn't play well with standards or anyone else).

[Hatch 1.0.0 - Modern, extensible Python project management : Python](https://www.reddit.com/r/Python/comments/udpzri/hatch_100_modern_extensible_python_project/)

[Switching to Hatch -- Oliver Andrich](https://andrich.me/2023/08/switching-to-hatch/)

[Hatch has too many dependencies - Issue #944 - pypa/hatch](https://github.com/pypa/hatch/issues/944)

The documentation is too brief, though PDM is worse.

## [Hatchling](https://github.com/pypa/hatch/tree/master/backend)
1.6 MiB

- [Wheel](https://hatch.pypa.io/latest/plugins/builder/wheel/)

- [Source distribution](https://hatch.pypa.io/latest/plugins/builder/sdist/)

  > When the user has not set any file selection options, all files that are not ignored by your VCS will be included.

[Supporting non-root VCS ignore - Issue #304 - pypa/hatch](https://github.com/pypa/hatch/issues/304)

[Monorepo support - Issue #233 - pypa/hatch](https://github.com/pypa/hatch/issues/233)

[Support for Editable Dependencies - Issue #588 - pypa/hatch](https://github.com/pypa/hatch/issues/588)

### requirements.txt
[hatch-requirements-txt: Hatchling plugin to read project dependencies from requirements.txt](https://github.com/repo-helper/hatch-requirements-txt)

```toml
[build-system]
requires = ["hatchling", "hatch-requirements-txt"]
build-backend = "hatchling.build"

[tool.hatch.metadata.hooks.requirements_txt]
files = ["requirements.txt"]
```

### Root layout
```toml
[tool.hatch.build.targets.sdist]
packages = ["."]

[tool.hatch.build.targets.wheel]
packages = ["."]
exclude = [
  "*.md",
  "/images",
  "/docs",
  "/examples",
  "/tests",
]

[tool.hatch.build.targets.sdist.sources]
# Package name. Must be an valid Python id (no dashes)
"." = "mypackage"

[tool.hatch.build.targets.wheel.sources]
# Same as above
"." = "mypackage"
```