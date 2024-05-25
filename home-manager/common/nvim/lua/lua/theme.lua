vim.g.background = "dark"
vim.cmd.colorscheme("ayu")
require('ayu').setup({
  mirage = false,
  terminal = false,
  overrides = {
    Normal        = { bg = "None",    fg = "#FCFCFC" },
    ColorColumn   = { bg = "None" },
    SignColumn    = { bg = "None" },
    Folded        = { bg = "None" },
    FoldColumn    = { bg = "None" },
    CursorColumn  = { bg = "None" },
    Line          = { bg = "None" },
  },
})

-- Body.
vim.api.nvim_set_hl(0, "NormalFloat",  { bg = "" })
vim.api.nvim_set_hl(0, "FloatBorder",  { bg = "",        fg = "#686f9a" })
vim.api.nvim_set_hl(0, "Search",       { bg = "#087e8b", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "EndOfBuffer",  { bg = "",        fg = "#090d12" })
vim.api.nvim_set_hl(0, "LineNr",       { bg = "",        fg = "#292948" })
vim.api.nvim_set_hl(0, "NonText",      { bg = "",        fg = "" })
vim.api.nvim_set_hl(0, "VertSplit",    { bg = "",        fg = "#1b1c36" })
vim.api.nvim_set_hl(0, "WinSeparator", { bg = "",        fg = "#1b1c36" })

-- Tabs.
vim.api.nvim_set_hl(0, "BufferTabpageFill",  { bg = "#090d12" })
vim.api.nvim_set_hl(0, "BufferCurrentSign",  { bg = "",           fg = "#087e8b" })
vim.api.nvim_set_hl(0, "BufferInactive",     { bg = "" })
vim.api.nvim_set_hl(0, "BufferInactiveSign", { bg = "",           fg = "#090d12" })
vim.api.nvim_set_hl(0, "BufferVisible",      { bg = "" })

-- Treesitter.
vim.api.nvim_set_hl(0, "ContextVt",         { bg = "", fg = "#686f9a" })
vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "" })

-- Statusline.
vim.api.nvim_set_hl(0, "StatusLine",     { bg = "", fg = "" })
vim.api.nvim_set_hl(0, "StatusLineTerm", { bg = "", fg = "" })

-- Splashscreen.
vim.api.nvim_set_hl(0, "AlphaHeader", { bg = "", fg = "#ffb703" })
vim.api.nvim_set_hl(0, "AlphaButton", { bg = "", fg = "#fefae0" })

-- Noice.
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderCmdline", { bg = "", fg = "#686f9a" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopup",              { bg = "", fg = "" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder",        { bg = "", fg = "" })

-- Git.
vim.api.nvim_set_hl(0, "GitSignsAdd",    { bg = "", fg = "#5ccc96" })
vim.api.nvim_set_hl(0, "GitSignsChange", { bg = "", fg = "#e39400" })
vim.api.nvim_set_hl(0, "GitSignsDelete", { bg = "", fg = "#ce6f8f" })

-- Notification.
vim.api.nvim_set_hl(0, "NotifyDEBUGBody",  { bg = "" })
vim.api.nvim_set_hl(0, "NotifyINFOBody",   { bg = "" })
vim.api.nvim_set_hl(0, "NotifyWARNBody",   { bg = "" })
vim.api.nvim_set_hl(0, "NotifyERRORBody",  { bg = "" })
vim.api.nvim_set_hl(0, "NotifyTRACEBody",  { bg = "" })
vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "" })

-- Telescope.
vim.api.nvim_set_hl(0, "TelescopeNormal",        { bg = "",                 link = "TelescopeNormal" })
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "",                 link = "TelescopePreviewNormal" })
vim.api.nvim_set_hl(0, "TelescopePromptNormal",  { bg = "",                 link = "TelescopePromptNormal" })
vim.api.nvim_set_hl(0, "TelescopeResultNormal",  { bg = "",                 link = "TelescopeResultNormal" })
vim.api.nvim_set_hl(0, "TelescopeBorder",        { bg = "", fg = "#686f9a", link = "TelescopeBorder" })

-- Tree.
vim.api.nvim_set_hl(0, "NeoTreeGitAdded",     { bg = "", fg = "#00B9AE" })
vim.api.nvim_set_hl(0, "NeoTreeGitConflict",  { bg = "", fg = "#ff0054" })
vim.api.nvim_set_hl(0, "NeoTreeGitDeleted",   { bg = "", fg = "#E23E58" })
vim.api.nvim_set_hl(0, "NeoTreeGitIgnored",   { bg = "", fg = "#686f9a" })
vim.api.nvim_set_hl(0, "NeoTreeGitModified",  { bg = "", fg = "#F3A712" })
vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { bg = "", fg = "#babd8d" })

-- LSP.
-- -- General.
vim.api.nvim_set_hl(0, "Pmenu",                       { fg = "#ecf0c1", bg = "" })
vim.api.nvim_set_hl(0, "PmenuSbar",                   { bg = "#272831" })
vim.api.nvim_set_hl(0, "PmenuDoc",                    { fg = "#ecf0c1", bg = "" })
-- -- Glance.
vim.api.nvim_set_hl(0, "GlancePreviewNormal",         { bg = "#000000" })
vim.api.nvim_set_hl(0, "GlancePreviewMatch",          { bg = "#000000" })
vim.api.nvim_set_hl(0, "GlancePreviewSignColumn",     { bg = "#000000" })
vim.api.nvim_set_hl(0, "GlancePreviewLineNr",         { bg = "#000000" })
vim.api.nvim_set_hl(0, "GlanceListNormal",            { bg = "#000000" })
-- -- Lsp Signature.
vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { bg = "#0e6ba8", fg = "#ffffff" })
-- -- Symbol usages.
vim.api.nvim_set_hl(0, "SymbolUsageText",             { fg = "#a5668b", italic = true, })
vim.api.nvim_set_hl(0, "SymbolUsageContent",          { fg = "#a5668b", italic = true, })

-- Treesitter.
vim.api.nvim_set_hl(0, "TreesitterContextSeparator", { bg = "", fg = "#1b1c36" })

-- Quickfix.
vim.api.nvim_set_hl(0, "BqfPreviewFloat",  { bg = "#090d12",                 link = "BqfPreviewFloat" })
vim.api.nvim_set_hl(0, "BqfPreviewBorder", { bg = "#090d12", fg = "#686f9a", link = "BqfPreviewBorder" })
vim.api.nvim_set_hl(0, "BqfPreviewTitle",  { bg = "#090d12",                 link = "BqfPreviewTitle" })
vim.api.nvim_set_hl(0, "BqfPreviewThumb",  { bg = "#090d12",                 link = "BqfPreviewThumb" })

-- Bookmark.
vim.g.bookmark_sign = ''
vim.g.bookmark_highlight_lines = 1
vim.g.bookmark_sho_warning = 0
vim.g.bookmark_show_toggle_warning = 0

-- Cursor.
vim.api.nvim_set_hl(0, "CursorLine",   { bg = "#161925", fg = "" })
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "",        fg = "#F3A712" })
vim.opt.guicursor = { "a:ver1" }

-- Modes.
require('modes').setup({
  colors = {
    insert = "#00f5d4",
    visual = "#e0aaff",
  },
})

-- FZF.
vim.g.fzf_colors = { border = { "fg" , "FloatBorder" }}
