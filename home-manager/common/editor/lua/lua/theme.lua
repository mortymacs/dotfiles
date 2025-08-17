-- Colorscheme.
vim.g.background = "dark"
require("tokyonight").setup({
    transparent = true,
});
vim.cmd.colorscheme("tokyonight-night")

-- Custom.
vim.api.nvim_set_hl(0, "FloatBorder",        { bg = "", fg = "#233d4d" })
vim.api.nvim_set_hl(0, "NormalFloat",        { bg = "" })
vim.api.nvim_set_hl(0, "BlinkCmpMenu",       { bg = "" })
vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { bg = "" , fg = "#233d4d" })

-- Noice.
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder",       { bg = "" , fg = "#233d4d" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderLua",    { bg = "" , fg = "#233d4d" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderSearch", { bg = "" , fg = "#233d4d" })

-- Snacks.
vim.api.nvim_set_hl(0, "SnacksPickerInputBorder", { bg = "" })

-- Whichkey.
vim.api.nvim_set_hl(0, "WhichKeyNormal", { bg = "" })

-- AI.
vim.api.nvim_set_hl(0, "AvantePromptInputBorder", { bg = "#03071e" })
vim.api.nvim_set_hl(0, "AvantePromptInput",       { bg = "#03071e" })

-- Bookmark.
vim.g.bookmark_sign = ''
vim.g.bookmark_highlight_lines = 1
vim.g.bookmark_sho_warning = 0
vim.g.bookmark_show_toggle_warning = 0

-- Cursor.
vim.opt.guicursor = { "a:block" }

-- Modes.
require('modes').setup()
