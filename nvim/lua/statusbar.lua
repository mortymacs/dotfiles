-- Lualine
require('lualine').setup({
  options = {
    theme = "spaceduck",
    section_separators = '',
    component_separators = '',
  },
  sections = {
    lualine_a = {{'filename', newfile_status = true, path = 1}},
    lualine_b = {'branch', 'diff'},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {'filetype', 'filesize'},
    lualine_z = {'progress'}
  },
})
vim.cmd("set cmdheight=1")
vim.cmd("set laststatus=3")

-- Trouble
require("trouble").setup()
