local wezterm = require("wezterm")
local config = wezterm.config_builder()
local padding = 10

-- Define configuration.
-- Body and display.
config.enable_tab_bar = false
config.line_height = 1.3
config.window_padding = {
  top = padding,
  left = padding,
  right = padding,
  bottom = padding,
}
config.use_resize_increments = true
config.audible_bell = "Disabled"
config.default_cursor_style = "SteadyBar"
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
-- Keybinding.
config.keys = {
  { key = "PageUp", mods = "CTRL", action = wezterm.action.DisableDefaultAssignment },
  { key = "PageDown", mods = "CTRL", action = wezterm.action.DisableDefaultAssignment },
}

return config
