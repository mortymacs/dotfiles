-- General
require("trim").setup()

-- Move lines
require("mini.move").setup({
  mappings = {
    left = "",
    right = "",
    down = "<s-m-down>",
    up = "<s-m-up>",
    line_left = "",
    line_right = "",
    line_down = "<s-m-down>",
    line_up = "<s-m-up>",
  },
})

-- Indentation
require("mini.indentscope").setup({
  draw = {
    animation = require("mini.indentscope").gen_animation.none(),
  },
  symbol = "│",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "alpha",
    "NvimTree",
  },
  command = ":lua vim.b.miniindentscope_disable=true",
})

-- TreeSJ.
require("treesj").setup()
