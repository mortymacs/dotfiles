require("github-theme").setup()
vim.cmd.colorscheme("spaceduck")
vim.g.lightline = {
    colorscheme = 'spaceduck',
}

-- Body
vim.api.nvim_set_hl(0, "Normal",      {bg = ""})
vim.api.nvim_set_hl(0, "EndOfBuffer", {bg = "", fg = "#0f0f0f"})
vim.api.nvim_set_hl(0, "LineNr",      {bg = "", fg = "#686f9a"})
vim.api.nvim_set_hl(0, "SignColumn",  {bg = ""})
vim.api.nvim_set_hl(0, "VertSplit",   {bg = "", fg = "#1b1c36"})
vim.api.nvim_set_hl(0, "NonText",     {bg = "", fg = ""})

-- Git
vim.api.nvim_set_hl(0, "GitSignsAdd",    {bg = "", fg = "#5ccc96"})
vim.api.nvim_set_hl(0, "GitSignsChange", {bg = "", fg = "#e39400"})
vim.api.nvim_set_hl(0, "GitSignsDelete", {bg = "", fg = "#ce6f8f"})

-- Terminal
vim.api.nvim_set_hl(0, "FloatermBorder", {fg = "#1b1c36"})

-- Notification
vim.api.nvim_set_hl(0, "NotifyDEBUGBody",  {bg = "#0f0f0f"})
vim.api.nvim_set_hl(0, "NotifyINFOBody",   {bg = "#0f0f0f"})
vim.api.nvim_set_hl(0, "NotifyWARNBody",   {bg = "#0f0f0f"})
vim.api.nvim_set_hl(0, "NotifyERRORBody",  {bg = "#0f0f0f"})
vim.api.nvim_set_hl(0, "NotifyTRACEBody",  {bg = "#0f0f0f"})
vim.api.nvim_set_hl(0, "NotifyBackground", {bg = "#0f0f0f"})

-- Telescope
vim.api.nvim_set_hl(0, "TelescopeNormal",        {bg = "#0f0f0f"})
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", {bg = "#0f0f0f"})
vim.api.nvim_set_hl(0, "TelescopePromptNormal",  {bg = "#0f0f0f"})
vim.api.nvim_set_hl(0, "TelescopeResultNormal",  {bg = "#0f0f0f"})

-- LSP
vim.api.nvim_set_hl(0, "NormalFloat",  {bg = ""})

-- FM
vim.api.nvim_set_hl(0, "NvimTreeStatusLine", {bg = "", fg = ""})

-- Bookmark
vim.g.bookmark_sign = ''
vim.g.bookmark_highlight_lines = 1
