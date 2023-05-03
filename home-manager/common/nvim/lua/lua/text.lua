-- General
require('trim').setup()

-- Move lines
require('mini.move').setup({
  mappings = {
    left = '',
    right = '',
    down = '<s-m-down>',
    up = '<s-m-up>',
    line_left = '',
    line_right = '',
    line_down = '<s-m-down>',
    line_up = '<s-m-up>',
  },
})

-- Indentation
require('mini.indentscope').setup({
    draw = {
        animation = require('mini.indentscope').gen_animation.none(),
    },
    symbol = "│",
})
vim.api.nvim_create_autocmd("FileType", { pattern = {"alpha", "NvimTree", "floaterm"}, command = ":lua vim.b.miniindentscope_disable=true" })

-- Highlight
require('illuminate').configure({
  filetypes_denylist = {"alpha", "NvimTree"},
})

-- Todo
require("todo-comments").setup({
    signs = false,
})

-- Surround.
require("nvim-surround").setup()

-- TreeSJ.
require("treesj").setup()
