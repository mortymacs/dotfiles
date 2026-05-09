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

-- Hlslens.
require("hlslens").setup()
