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

-- LSP.
-- -- General.
vim.api.nvim_set_hl(0, "Pmenu",     { bg = "" })
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#272831" })
vim.api.nvim_set_hl(0, "PmenuDoc",  { bg = "" })
-- -- Lsp Signature.
vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { bg = "" })

-- Bookmark.
vim.g.bookmark_sign = ''
vim.g.bookmark_highlight_lines = 1
vim.g.bookmark_sho_warning = 0
vim.g.bookmark_show_toggle_warning = 0

-- Cursor.
vim.opt.guicursor = "a:block"

-- Icons.
vim.fn.sign_define("DapStopped",            { text = "", texthl = "SignColumn", linehl = "debugPC" })
vim.fn.sign_define("DapLogPoint",           { text = "", texthl = "SignColumn" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "SignColumn" })
vim.fn.sign_define("DapBreakpointCondition",{ text = "", texthl = "SignColumn" })
vim.fn.sign_define("DapBreakpoint",         { text = "", texthl = "SignColumn" })
vim.fn.sign_define("Bookmark",              { text = "", linehl = "BookmarkLine", texthl = "BookmarkSign" })
vim.fn.sign_define("BookmarkAnnotation",    { text = "", linehl = "BookmarkAnnotationLine", texthl = "BookmarkAnnotationSign" })

-- Modes.
require('modes').setup()
