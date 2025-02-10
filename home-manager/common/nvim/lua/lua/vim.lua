-- Performance
vim.loader.enable()

-- Body
vim.opt.nu = true
vim.opt.relativenumber = false
vim.opt.fillchars = "eob: "
vim.opt.splitkeep = "screen"

-- File, syntax and theme
vim.opt.filetype = "on"
vim.opt.compatible = false
vim.opt.syntax = "on"
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Backup
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.updatetime = 100

-- Indentation
vim.opt.cindent = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.backspace = "2"
vim.opt.list = false

-- Fold.
vim.opt.foldlevel = 99
vim.opt.conceallevel = 2
vim.o.foldcolumn = "0"
vim.o.foldlevelstart = 99
vim.o.foldenable = false

-- Menu
vim.opt.completeopt = "menu,menuone,noselect"

-- Statusline
vim.opt.statusline = ""
vim.opt.cmdheight = 1
vim.opt.laststatus = 3

-- Line number
vim.opt.numberwidth = 5

-- Wrap
vim.opt.wrap = false

-- Mouse
vim.opt.mouse = ""

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Timeout
vim.opt.timeout = true
vim.opt.timeoutlen = 300

-- GUI.
if vim.g.neovide then
  vim.opt.winblend = 20
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.o.guifont = "monospace:h12"
  vim.g.neovide_transparency = 0.8
  vim.g.neovide_theme = "auto"
  vim.g.neovide_scroll_animation_length = 0.3
  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_cursor_trail_size = 0.8
  vim.g.neovide_cursor_animate_command_line = true
  vim.g.neovide_cursor_smooth_blink = true
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_vfx_particle_speed = 10.0
  vim.g.neovide_cursor_vfx_particle_density = 15
  vim.g.neovide_cursor_vfx_particle_phase = 1
  vim.g.neovide_cursor_vfx_particle_curl = 0
  vim.opt.mouse = "a"
  vim.g.neovide_text_gamma = 1
  vim.g.neovide_text_contrast = 0
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5
end

-- Misc
vim.opt.hidden = true
-- vim.opt.signcolumn = "auto:2"
vim.opt.colorcolumn = "120"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
