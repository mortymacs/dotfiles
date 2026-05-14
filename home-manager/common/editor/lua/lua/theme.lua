-- Colorscheme.
vim.g.background = "dark"
require("tokyonight").setup({
  transparent = true,
  styles = {
    sidebars = "transparent",
    floats = "transparent",
  },
  sidebars = { "neo-tree", "qf", "help", "terminal" },
})
vim.cmd.colorscheme("tokyonight-night")

-- Custom.
vim.api.nvim_set_hl(0, "WinSeparator", { bg = "", fg = "#1A1B26" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "", fg = "#233d4d" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "" })

-- BQF.
vim.api.nvim_set_hl(0, "BqfPreviewFloat", { bg = "#272831" })

-- LSP.
-- -- General.
vim.api.nvim_set_hl(0, "Pmenu",     { bg = "" })
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#272831" })
vim.api.nvim_set_hl(0, "PmenuDoc",  { bg = "" })
vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = "" })
vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { bg = "", fg = "#233d4d" })
-- -- Lsp Signature.
vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { bg = "" })

-- Whichkey.
vim.api.nvim_set_hl(0, "WhichKeyNormal", { bg = "" })

-- Modes.
require("modes").setup({
  colors = {
    insert = "#589BC4",
    visual = "#BB58C4",
  },
  line_opacity = 0.40,
})
