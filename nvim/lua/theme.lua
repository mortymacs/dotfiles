vim.cmd.colorscheme("spaceduck")
vim.g.lightline = "{'colorscheme': 'spaceduck'}"

-- Body
vim.api.nvim_set_hl(0, "Normal", {bg = ""})
vim.api.nvim_set_hl(0, "EndOfBuffer", {bg = "", fg = "#0f0f0f"})
vim.api.nvim_set_hl(0, "LineNr", {bg = "", fg = "#686f9a"})
vim.api.nvim_set_hl(0, "SignColumn", {bg = ""})
vim.api.nvim_set_hl(0, "VertSplit", {bg = "", fg = "#1b1c36"})
vim.api.nvim_set_hl(0, "NonText", {bg = "", fg = ""})

-- Git
vim.api.nvim_set_hl(0, "GitSignsAdd", {bg = "", fg = "#5ccc96"})
vim.api.nvim_set_hl(0, "GitSignsChange", {bg = "", fg = "#e39400"})
vim.api.nvim_set_hl(0, "GitSignsDelete", {bg = "", fg = "#ce6f8f"})

-- Terminal
vim.api.nvim_set_hl(0, "FloatermBorder", {fg = "#1b1c36"})

-- Telescope
vim.api.nvim_set_hl(0, "TelescopeNormal", {bg = ""})
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", {bg = ""})
vim.api.nvim_set_hl(0, "TelescopePromptNormal", {bg = ""})
vim.api.nvim_set_hl(0, "TelescopeResultNormal", {bg = ""})

-- Bookmark
vim.g.bookmark_sign = ''
vim.g.bookmark_highlight_lines = 1
