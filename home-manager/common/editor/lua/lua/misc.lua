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

-- Whichkey.
require("which-key").setup({
  delay = 1000,
  win = {
    border = "single",
  },
  disable = {
    ft = { "toggleterm" },
  },
})

-- Showkeys.
require("showkeys").setup({
  maxkeys = 5,
  excluded_modes = { "i" },
})
