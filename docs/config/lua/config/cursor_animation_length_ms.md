---
tags:
  - appearance
  - text_cursor
---
# `cursor_animation_length_ms`

Sets the duration of the Neovide-style critically damped cursor animation in
milliseconds. The default is `150`. The animation must also be enabled with
[`cursor_animation_enabled`](cursor_animation_enabled.md). Set this value to
`0` to disable cursor movement animation and use WezTerm's immediate cursor
rendering.

```lua
config.cursor_animation_length_ms = 150
```

See also [cursor_animation_enabled](cursor_animation_enabled.md),
[cursor_animation_short_length_ms](cursor_animation_short_length_ms.md), and
[cursor_trail_size](cursor_trail_size.md).
