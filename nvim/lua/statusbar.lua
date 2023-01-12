-- Lualine
require('lualine').setup({
  options = {
    theme = "auto",
    section_separators = "",
    component_separators = "",
    disabled_filetypes = {
      statusline = {"NvimTree"},
    },
  },
  sections = {
    lualine_a = {{"filename", newfile_status = true, path = 1}},
    lualine_b = {"branch", "diff"},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {"filetype", "filesize"},
    lualine_z = {"progress"},
  },
})
vim.cmd("set cmdheight=0")
vim.cmd("set laststatus=3")

-- Trouble
require("trouble").setup()
