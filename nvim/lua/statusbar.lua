-- Lualine
require('lualine').setup({
  options = {
    theme = "ayu_mirage",
    section_separators = {left = "", right = ""},
    component_separators = "",
    disabled_filetypes = {
      statusline = {"NvimTree"},
    },
    globalstatus = true,
  },
  sections = {
    lualine_a = {},
    lualine_b = {{"filename", newfile_status = true, path = 1}, "branch", "diff" },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {"filetype", "filesize"},
    lualine_z = {"progress"},
  },
})
vim.cmd("set cmdheight=1")
vim.cmd("set laststatus=3")

-- Trouble
require("trouble").setup()
