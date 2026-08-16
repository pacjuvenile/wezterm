---
tags:
  - appearance
  - text_cursor
---
# `cursor_animation_enabled`

Enables Neovide-style cursor movement animation. The default is `false`, so
the cursor uses WezTerm's immediate rendering unless this option is enabled.

```lua
config.cursor_animation_enabled = true
```

The animation can be tuned with
[`cursor_animation_length_ms`](cursor_animation_length_ms.md),
[`cursor_animation_short_length_ms`](cursor_animation_short_length_ms.md), and
[`cursor_trail_size`](cursor_trail_size.md).
