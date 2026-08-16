---
tags:
  - security
  - clipboard
---
# `osc52`

Controls whether applications can use OSC 52 escape sequences to access the
system clipboard. The accepted values match Alacritty's OSC 52 policy:

* `"Disabled"` rejects clipboard reads and writes.
* `"OnlyCopy"` allows applications to write to the clipboard. This is the
  default.
* `"OnlyPaste"` allows applications to read the clipboard.
* `"CopyPaste"` allows both operations.

Clipboard reads send local clipboard data back to the application running in
the pane. Enable `"OnlyPaste"` or `"CopyPaste"` only for trusted applications
and hosts.

```lua
config.osc52 = 'CopyPaste'
```
