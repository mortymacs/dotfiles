-- Large files.
require("bigfile").setup({
  filesize = 2,
  pattern = { "*" },
  features = {
    "indent_blankline",
    "illuminate",
    "lsp",
    "treesitter",
    "matchparen",
    "vimopts",
  },
})

-- Noice.
require("noice").setup()
