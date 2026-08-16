---
tags:
  - appearance
  - text_cursor
---
# `cursor_trail_size`

Controls how far the back edge of the animated cursor trails its front edge.
The default is `1.0`, matching Neovide. Values are clamped to the range from
`0.0` through `1.0` when the animation is evaluated; `0.0` moves all four
corners together, while `1.0` produces the longest trail. This setting takes
effect when [`cursor_animation_enabled`](cursor_animation_enabled.md) is
`true`.

```lua
config.cursor_trail_size = 1.0
```
