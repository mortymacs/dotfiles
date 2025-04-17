-- Colorscheme.
vim.g.background = "dark"
vim.cmd.colorscheme("tokyonight-night")

-- Custom.
vim.api.nvim_set_hl(0, "FloatBorder",        { bg = "", fg = "#0BB8D3" })
vim.api.nvim_set_hl(0, "NormalFloat",        { bg = "" })
vim.api.nvim_set_hl(0, "BlinkCmpMenu",       { bg = "" })
vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { bg = "" , fg = "#0BB8D3" })

-- Bookmark.
vim.g.bookmark_sign = ''
vim.g.bookmark_highlight_lines = 1
vim.g.bookmark_sho_warning = 0
vim.g.bookmark_show_toggle_warning = 0

-- Cursor.
vim.opt.guicursor = { "a:block" }

-- Modes.
require('modes').setup()
