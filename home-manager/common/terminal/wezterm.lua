local wezterm = require("wezterm")
local action = wezterm.action
local config = wezterm.config_builder()
local padding = 10

-- Body and display.
config.enable_tab_bar = false
config.window_padding = {
  top = padding,
  left = padding,
  right = padding,
  bottom = padding,
}
config.use_resize_increments = true
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'
-- Font.
config.font = wezterm.font("monospace")
config.font_size = 12.5
config.freetype_load_target = "Normal"
-- Theme.
config.color_scheme = "ayu"
config.colors = {
  background = "#0B1015",
  foreground = "#FCFCFC",
  selection_bg = "#202c3e",
  selection_fg = "#fcfcfc",
  cursor_bg = "#344866",
  cursor_fg = "#fcfcfc",
}
-- Mouse.
config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "NONE",
    action = action.CompleteSelection("ClipboardAndPrimarySelection"),
  },
}

return config
