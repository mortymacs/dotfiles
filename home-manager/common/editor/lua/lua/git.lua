require("gitsigns").setup({
  signs = {
    add = { text = "┃" },
    change = { text = "┃" },
    delete = { text = "┃" },
    topdelete = { text = "╏" },
    changedelete = { text = "┇" },
    untracked = { text = "┃" },
  },
  preview_config = {
    border = "single",
  },
})

-- Diffview
require("diffview").setup()
