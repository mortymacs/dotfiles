-- Setup.
local left_icon = ""
local right_icon = ""
local left_left_icon = "" -- right_icon
local right_right_icon = "" -- left_icon
require("lualine").setup({
  options = {
    theme = "github_dark_dimmed",
    component_separators = { left = "", right = "" },
    section_separators = { left = left_icon, right = right_icon },
    globalstatus = true,
    disabled_filetypes = { "fzf", "snacks_terminal" },
  },
  sections = {
    lualine_a = {
      {
        "filename",
        newfile_status = true,
        path = 1,
        symbols = {
          modified = "[+]",
          readonly = "[-]",
          unnamed = "[No Name]",
          newfile = "[New]",
        },
        separator = {
          left = left_left_icon,
          right = left_icon,
        },
      },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {
      require("lsp-progress").progress,
      "branch",
      "diff",
      "diagnostics",
    },
    lualine_z = {
      "filetype",
      "filesize",
      {
        "progress",
        separator = {
          left = right_icon,
          right = right_right_icon,
        },
      },
    },
  },
})

-- listen lsp-progress event and refresh lualine
vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
  group = "lualine_augroup",
  pattern = "LspProgressStatusUpdated",
  callback = require("lualine").refresh,
})
