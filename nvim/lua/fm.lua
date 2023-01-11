require("util")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require('nvim-tree').setup({
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  disable_netrw = true,
  hijack_cursor = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
  renderer = {
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
    special_files = {"Makefile", "CMakeLists.txt", "Cargo.toml", "Magefile", "go.mod", "go.sum", "pyproject.toml"},
  },
  filters = {
    custom = {"^\\.git", "^\\.venv"},
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = false,
  },
  git = {
    enable = true,
    ignore = true,
    show_on_dirs = false,
    timeout = 400,
  },
  view = {
    hide_root_folder = true,
    signcolumn = "no",
    mappings = {
      custom_only = true,
      list = {
        { key = "<cr>",       action = "edit" },
        { key = "v",          action = "vsplit" },
        { key = "h",          action = "split" },
        { key = "<tab>",      action = "preview" },
        { key = "g",          action = "refresh" },
        { key = "n",          action = "create" },
        { key = "d",          action = "remove" },
        { key = "r",          action = "rename" },
        { key = "m",          action = "cut" },
        { key = "c",          action = "copy" },
        { key = "p",          action = "paste" },
        { key = "bp",         action = "bulk_move" },
        { key = "y",          action = "copy_name" },
        { key = "Y",          action = "copy_absolute_path" },
        { key = "/",          action = "live_filter" },
        { key = "<c-f>",      action = "search_node" },
        { key = "<c-]>",      action = "close" },
      },
    },
  },
  renderer = {
    icons = {
      padding = " ",
      symlink_arrow = "",
      show = {
        folder_arrow = false,
      },
      glyphs = {
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
      },
    },
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
  },
  actions = {
    open_file = {
      resize_window = false,
    },
  },
})

require("telescope").setup({
  defaults = {
    layout_strategy = 'vertical',
    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
  },
  pickers = {
    find_files = {
      borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
    },
  },
})

require('telescope').load_extension("vim_bookmarks")
require("telescope").load_extension("file_browser")
