require('nvim-treesitter.configs').setup({
  ensure_installed = {},
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})
require("treesitter-context").setup()
