#import "@local/ib:0.1.0": *
#title[uv on Windows]
= Wine
- ```sh uv run --link-mode=copy ...```
  #footnote[#a[Settings | uv][https://docs.astral.sh/uv/reference/settings/#link-mode]]
  or ```sh UV_LINK_MODE=copy```
  - Only needed at the first time.

  Otherwise:
  ```sh
  error: Failed to create Python minor version link directory
    Caused by: Request not supported. (os error 50)
  ```
