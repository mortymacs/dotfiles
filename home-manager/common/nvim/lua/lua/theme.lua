-- Colorscheme.
vim.g.background = "dark"
vim.cmd.colorscheme("ayu")
require('ayu').setup({
  mirage = false,
  terminal = false,
  overrides = {
    Normal        = { bg = "",   fg = "#FCFCFC" },
    ColorColumn   = { bg = "" },
    SignColumn    = { bg = "" },
    CursorColumn  = { bg = "" },
    Line          = { bg = "" },
  },
})

-- Body.
vim.api.nvim_set_hl(0, "Normal",       { bg = "" })
vim.api.nvim_set_hl(0, "NormalFloat",  { bg = "" })
vim.api.nvim_set_hl(0, "SignColumn",   { bg = "" })
vim.api.nvim_set_hl(0, "FloatBorder",  { bg = "",        fg = "#686f9a" })
vim.api.nvim_set_hl(0, "Search",       { bg = "#087e8b", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "EndOfBuffer",  { bg = "",        fg = "#090d12" })
vim.api.nvim_set_hl(0, "LineNr",       { bg = "",        fg = "#292948" })
vim.api.nvim_set_hl(0, "NonText",      { bg = "",        fg = ""        })
vim.api.nvim_set_hl(0, "VertSplit",    { bg = "",        fg = "#1b1c36" })
vim.api.nvim_set_hl(0, "WinSeparator", { bg = "",        fg = "#1b1c36" })

-- Tabs.
vim.api.nvim_set_hl(0, "BufferDefaultVisible",     { bg = "" })
vim.api.nvim_set_hl(0, "BufferDefaultInactive",    { bg = "" })
vim.api.nvim_set_hl(0, "BufferDefaultCurrent",     { bg = "" })
vim.api.nvim_set_hl(0, "BufferInactiveMod",        { bg = "" })
vim.api.nvim_set_hl(0, "BufferDefaultInactiveMod", { bg = "" })
vim.api.nvim_set_hl(0, "BufferDefaultVisibleMod",  { bg = "" })
vim.api.nvim_set_hl(0, "BufferDefaultTabpageFill", { bg = "" })
vim.api.nvim_set_hl(0, "BufferTabpagesSep",        { bg = "",   fg = "#087e8b" })
vim.api.nvim_set_hl(0, "BufferTabpageFill",        { bg = "" })
vim.api.nvim_set_hl(0, "BufferCurrent",            { bg = "",   fg = "#087e8b" })
vim.api.nvim_set_hl(0, "BufferCurrentSign",        { bg = "",   fg = "#087e8b" })
vim.api.nvim_set_hl(0, "BufferInactive",           { bg = "" })
vim.api.nvim_set_hl(0, "BufferInactiveSign",       { bg = "",   fg = "#090d12" })
vim.api.nvim_set_hl(0, "BufferVisible",            { bg = "" })

-- Treesitter.
vim.api.nvim_set_hl(0, "ContextVt",                  { bg = "", fg = "#686f9a" })
vim.api.nvim_set_hl(0, "TreesitterContext",          { bg = "" })
vim.api.nvim_set_hl(0, "TreesitterContextSeparator", { bg = "", fg = "#1b1c36" })

-- Statusline.
vim.api.nvim_set_hl(0, "StatusLine",     { bg = "", fg = "" })
vim.api.nvim_set_hl(0, "StatusLineTerm", { bg = "", fg = "" })

-- CMP.
vim.api.nvim_set_hl(0, "CmpItemKindCody", { fg = "#8eecf5" })

-- Git.
vim.api.nvim_set_hl(0, "GitSignsAdd",    { bg = "", fg = "#5ccc96" })
vim.api.nvim_set_hl(0, "GitSignsChange", { bg = "", fg = "#e39400" })
vim.api.nvim_set_hl(0, "GitSignsDelete", { bg = "", fg = "#ce6f8f" })

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

-- Hlslens.
vim.api.nvim_set_hl(0, "HlSearchLens", { bg = "#ffb703", fg = "#000000" })

-- Folded.
vim.api.nvim_set_hl(0, "Folded",      { bg = "#1a1423", fg = "" })
vim.api.nvim_set_hl(0, "UfoFoldedBg", { bg = "",        fg = "" })

-- LSP.
-- -- General.
vim.api.nvim_set_hl(0, "Pmenu",                       { fg = "#ecf0c1", bg = "" })
vim.api.nvim_set_hl(0, "PmenuSbar",                   { bg = "#272831" })
vim.api.nvim_set_hl(0, "PmenuDoc",                    { fg = "#ecf0c1", bg = "" })
-- -- Lsp Signature.
vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { bg = "#0e6ba8", fg = "#ffffff" })
-- -- InlayHint.
vim.api.nvim_set_hl(0, "LspInlayHint",                { fg = "#9a8c98", italic = true, })
-- -- Symbol usages.
vim.api.nvim_set_hl(0, "SymbolUsageText",             { fg = "#a5668b", italic = true, })
vim.api.nvim_set_hl(0, "SymbolUsageContent",          { fg = "#a5668b", italic = true, })

-- Todo.
vim.api.nvim_set_hl(0, "TodoBgFIX", { bg = "#ef233c", fg = "#fefae0", bold = true })
vim.api.nvim_set_hl(0, "TodoFgFIX", {                 fg = "#ef233c"})

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
vim.opt.guicursor = { "a:block" }

-- Markdown.
vim.api.nvim_set_hl(0, "RenderMarkdown_Inverse_RenderMarkdownCode", { fg = "#6d597a" })

-- Modes.
require('modes').setup({
  colors = {
    insert = "#00f5d4",
    visual = "#e0aaff",
  },
})
