-- Leap.
require("leap").create_default_mappings()

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

-- Dressing.
require("dressing").setup({
  input = {
    enabled = true,
    border = "single",
    prefer_width = 10,
    min_width = { 10, 0.1 },
  },
})
