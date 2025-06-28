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
require("noice").setup({
  lsp = {
    progress = {
      enabled = false,
    },
  },
  presets = {
    long_message_to_split = true,
    lsp_doc_border = true,
  },
  views = {
    cmdline_popup = {
      position = {
        row = 5,
        col = "50%",
      },
      size = {
        width = 60,
        height = "auto",
      },
      border = {
        style = "single",
      },
    },
  },
})

-- Bookmark.
vim.g.bookmark_auto_save_file = vim.env.HOME .. "/.local/share/nvim/vim-bookmarks"
