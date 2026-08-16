---
tags:
  - appearance
  - text_cursor
---
# `cursor_animation_short_length_ms`

Sets the animation duration for horizontal cursor moves of two cells or fewer.
The default is `40` milliseconds, matching Neovide's fast path for typing and
repeated horizontal movement. This setting takes effect when
[`cursor_animation_enabled`](cursor_animation_enabled.md) is `true`.

```lua
config.cursor_animation_short_length_ms = 40
```
