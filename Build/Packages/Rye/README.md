# Rye
[GitHub](https://github.com/astral-sh/rye)

[Flask 作者的新作： Rye，个人管理 Python 项目的一站式工具。 - V2EX](https://v2ex.com/t/935951)

[Rye Grows With UV | Armin Ronacher's Thoughts and Writings](https://lucumr.pocoo.org/2024/2/15/rye-grows-with-uv/)
> Rye will continue to be a test bed for what Python tooling can be... As the user experience becomes more obvious uv itself will turn from what it is today — low level plumbing — into that higher level tool with a clear migration path of folks using rye to that new uv.

[How will `rye` and `uv` coexist in the future? - astral-sh/rye - Discussion #1164](https://github.com/astral-sh/rye/discussions/1164)
> This was a few months ago and we're clearly devoting a lot of resources to exploring new workflows in uv right now. I think this is mostly because it's been easier for us to build on top of uv's code rather than Rye's. We're focusing on reaching parity with tools like pipx and Poetry while adding Rye-inspired features like workspaces, Python toolchain management, and dependency sources. There are new uv workflows that overlap with Rye, but there are also Rye features that aren't a focus yet like running tests, building wheels, and publishing packages. Rye is still functioning as a place to explore innovation in Python tooling, it can move quickly by making compromises like using other tools under the hood.