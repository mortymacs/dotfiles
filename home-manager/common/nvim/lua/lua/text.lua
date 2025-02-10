-- General
require("trim").setup()

-- Move lines
require("mini.move").setup({
  mappings = {
    left = "",
    right = "",
    down = "<s-m-j>",
    up = "<s-m-k>",
    line_left = "",
    line_right = "",
    line_down = "<s-m-j>",
    line_up = "<s-m-k>",
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "NvimTree",
  },
  command = ":lua vim.b.miniindentscope_disable=true",
})

-- TreeSJ.
require("treesj").setup()
