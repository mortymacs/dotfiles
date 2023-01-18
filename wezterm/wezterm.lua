local wezterm = require 'wezterm'
return {
  -- Window
  window_decorations = "NONE",
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },

  -- Tab
  use_fancy_tab_bar = false,
  show_tabs_in_tab_bar = true,
  show_new_tab_button_in_tab_bar = false,
  tab_bar_at_bottom = true,
  hide_tab_bar_if_only_one_tab = true,

  -- Font
  font = wezterm.font 'monospace',
  font_size = 12,

  -- Colors
  colors = {
    -- Body
    background = '#0f0f0f',
    foreground = '#ecf0c1',

    -- Cursor
    cursor_bg = '#4B3F72',
    cursor_fg = '#ecf0c1',

    -- Selection
    selection_fg = '#ecf0c1',
    selection_bg = '#1F2041',

    -- Split
    split = '#1F2041',

    -- Colors
    ansi = {
      '#000000',
      '#e33400',
      '#5ccc96',
      '#b3a1e6',
      '#00a3cc',
      '#f2ce00',
      '#7a5ccc',
      '#686f9a',
    },
    brights = {
      '#686f9a',
      '#e33400',
      '#5ccc96',
      '#b3a1e6',
      '#00a3cc',
      '#f2ce00',
      '#7a5ccc',
      '#f0f1ce',
    },
  },
}
