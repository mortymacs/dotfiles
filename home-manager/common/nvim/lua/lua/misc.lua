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

-- Scrollview.
require("scrollview").setup({
  excluded_filetypes = { "nerdtree", "terminal", "Outline", "toggleterm", "fzf" },
})

-- Cursor.
require("beacon").setup({
  fps = 100,
  highlight = { bg = "#4361ee" },
})
