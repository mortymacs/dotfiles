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

-- AI.
require("sg").setup({
  enable_cody = vim.fn.getenv("SRC_CODY_STATUS") == "1" and true or false,
})
