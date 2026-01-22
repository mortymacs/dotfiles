-- Telescope.
require("telescope").setup({
  defaults = {
    results_title = false,
    prompt_title = false,
    layout_strategy = "vertical",
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    mappings = {
      i = {
        ["<A-j>"] = require("telescope.actions").move_selection_next,
        ["<A-k>"] = require("telescope.actions").move_selection_previous,
        ["<C-j>"] = require("telescope.actions").preview_scrolling_down,
        ["<C-k>"] = require("telescope.actions").preview_scrolling_up,
      },
      n = {
        ["<A-j>"] = require("telescope.actions").move_selection_next,
        ["<A-k>"] = require("telescope.actions").move_selection_previous,
        ["<C-j>"] = require("telescope.actions").preview_scrolling_down,
        ["<C-k>"] = require("telescope.actions").preview_scrolling_up,
      },
    },
  },
  pickers = {
    find_files = {
      borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    },
    lsp_references = {
      fname_width = 80,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    ast_grep = {
      command = {
        "ast-grep",
        "--json=stream",
        "-p",
      },
      grep_open_files = false,
      lang = nil,
    },
  },
})

-- Plugins.
require("telescope").load_extension("fzf")
require("telescope").load_extension("vim_bookmarks")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("undo")
require("telescope").load_extension("ast_grep")
require("telescope").load_extension("live_grep_args")
require("telescope").load_extension("ghq")

-- Hlslens.
require("hlslens").setup()

-- Snacks.
-- For the ascii art https://www.asciiart.eu/text-to-ascii-art
require("snacks").setup({
  styles = {
    blame_line = { border = "single" },
    input = { border = "single" },
    notification = { border = "single" },
  },
  picker = {
    previewers = {
      file = {
        max_line_length = 1000,
      },
    },
    layout = "default",
    layouts = {
      default = {
        layout = {
          box = "vertical",
          width = 0.8,
          height = 0.5,
          {
            box = "vertical",
            border = "single",
            { win = "preview", border = "none" },
            { win = "list", height = 10, border = "top" },
            { win = "input", height = 1, border = "top" },
          },
        },
      },
    },
    win = {
      input = {
        keys = {
          ["<m-j>"] = { "list_down", mode = { "i", "n" } },
          ["<m-k>"] = { "list_up", mode = { "i", "n" } },
          ["<c-j>"] = { "preview_scroll_down", mode = { "i", "n" } },
          ["<c-k>"] = { "preview_scroll_up", mode = { "i", "n" } },
        },
      },
      list = {
        keys = {
          ["<m-j>"] = "list_down",
          ["<m-k>"] = "list_up",
          ["<c-j>"] = "preview_scroll_down",
          ["<c-k>"] = "preview_scroll_up",
        },
      },
    },
    grep_word = {
      finder = "rg",
    },
  },
  lazygit = { enabled = false },
  bigfile = { enabled = true },
  dashboard = {
    enabled = true,
    pane_gap = 4,
    preset = {
      keys = {},
      header = [[
/////////////////////////////
//░█▀█░█▀▀░█▀█░█░█░▀█▀░█▄█░//
//░█░█░█▀▀░█░█░▀▄▀░░█░░█░█░//
//░▀░▀░▀▀▀░▀▀▀░░▀░░▀▀▀░▀░▀░//
/////////////////////////////]],
    },
  },
  dim = {
    enabled = true,
    animate = { enabled = false },
  },
  indent = {
    enabled = false,
  },
  input = {
    enabled = true,
  },
  notifier = {
    enabled = true,
  },
  quickfile = { enabled = true },
  scroll = { enabled = false },
  statuscolumn = {
    enabled = true,
    left = { "mark", "sign" },
    right = { "fold", "git" },
    folds = {
      open = false,
      git_hl = false,
    },
    git = {
      patterns = { "GitSign", "MiniDiffSign" },
    },
    refresh = 50,
  },
  words = { enabled = true },
  terminal = {
    enabled = true,
    bo = {
      filetype = "snacks_terminal",
    },
    win = {
      style = "terminal",
    },
    wo = {
      winbar = "",
    },
  },
})

-- Harpoon.
require("harpoon").setup()
