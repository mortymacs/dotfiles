-- FZF.
vim.g.fzf_layout = {
  window = {
    width = 0.9,
    height = 0.7,
    border = "sharp",
  },
}
vim.g.fzf_preview_window = {
  "up,65%",
}

-- Telescope.
require("telescope").setup({
  defaults = {
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
  },
  extensions = {
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
require("telescope").load_extension("vim_bookmarks")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("undo")
require("telescope").load_extension("advanced_git_search")
require("telescope").load_extension("ast_grep")
require("telescope").load_extension("live_grep_args")
require("telescope").load_extension("nerdy")

-- Hlslens.
require("hlslens").setup()
