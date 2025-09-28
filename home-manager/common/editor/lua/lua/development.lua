-- Treesitter setup.
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c",
    "cpp",
    "go",
    "python",
    "lua",
    "bash",
    "sql",
    "markdown",
    "markdown_inline",
    "dockerfile",
    "hcl",
    "vim",
    "json",
    "yaml",
    "toml",
    "html",
    "css",
    "query",
    "regex",
    "http",
    "vimdoc",
    "make",
    "cmake",
  },
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ip"] = "@parameter.inner",
        ["ap"] = "@parameter.outer",
      },
      selection_modes = {
        ["@parameter.outer"] = "v", -- charwise
        ["@function.outer"] = "V", -- linewise
        ["@class.outer"] = "<c-v>", -- blockwise
      },
      include_surrounding_whitespace = true,
    },
    swap = {
      enable = true,
      swap_next = {
        ["<c-c>n"] = "@parameter.inner",
      },
      swap_previous = {
        ["<c-c>p"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next = {
        ["<c-c>j"] = "@function.inner",
        ["<c-c>l"] = "@parameter.inner",
      },
      goto_previous = {
        ["<c-c>k"] = "@function.inner",
        ["<c-c>h"] = "@parameter.inner",
      },
    },
  },
})

-- Treesitter plugins.
require("treesitter-context").setup({
  max_lines = 10,
  separator = "─",
})
require("nvim_context_vt").setup({
  disable_virtual_lines = true,
  disable_ft = { "markdown", "yaml" },
})
require("rainbow-delimiters.setup").setup({
  highlight = {
    "RainbowDelimiterYellow",
    "RainbowDelimiterOrange",
    "RainbowDelimiterBlue",
    "RainbowDelimiterGreen",
    "RainbowDelimiterViolet",
  },
})
vim.g.skip_ts_context_commentstring_module = true

-- Comment.
require("Comment").setup({
  pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  toggler = {
    line = "<c-c><c-c>",
  },
  opleader = {
    line = "<c-c><c-c>",
  },
})

-- Colorizer.
require("nvim-highlight-colors").setup()

-- Todo.
require("todo-comments").setup({
  signs = true,
  keywords = {
    FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
    TODO = { icon = " ", color = "info", alt = { "TASK" } },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    TEST = { icon = "󱤤 ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
  },
})

require("minty").setup()

-- Surround.
require("nvim-surround").setup({
  keymaps = {
    insert = nil,
    insert_line = nil,
    normal = nil,
    normal_cur = nil,
    normal_line = nil,
    normal_cur_line = nil,
    visual = "va",
    visual_line = nil,
    delete = "da",
    change = "ca",
  },
})

-- Formatter.
local util = require("formatter.util")
require("formatter").setup({
  logging = true,
  log_level = vim.log.levels.ERROR,
  filetype = {
    c = {
      function()
        return {
          exe = "clang-format",
          args = {
            "--style=Google",
            "--assume-filename",
            util.escape_path(util.get_current_buffer_file_name()),
          },
          stdin = true,
        }
      end,
    },

    cpp = {
      function()
        return {
          exe = "clang-format",
          args = {
            "--style=Google",
            "--assume-filename",
            util.escape_path(util.get_current_buffer_file_name()),
          },
          stdin = true,
        }
      end,
    },

    go = {
      function()
        return {
          exe = "goimports-reviser",
          args = {
            "-output",
            "stdout",
            "-rm-unused",
            util.escape_path(util.get_current_buffer_file_path()),
          },
          stdin = true,
        }
      end,
      require("formatter.filetypes.go").gofmt,
    },

    python = {
      require("formatter.filetypes.python").isort,
      require("formatter.filetypes.python").black,
      require("formatter.filetypes.python").ruff,
    },

    lua = {
      function()
        -- Ignore files.
        if
          util.get_current_buffer_file_name() == "keymap.lua" or util.get_current_buffer_file_name() == "theme.lua"
        then
          return nil
        end
        return {
          exe = "stylua",
          args = {
            "--column-width",
            "120",
            "--indent-type",
            "Spaces",
            "--indent-width",
            "2",
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end,
    },

    javascript = {
      require("formatter.filetypes.javascript").prettier,
    },

    sh = {
      require("formatter.filetypes.sh").shfmt,
    },

    nix = {
      require("formatter.filetypes.nix").nixfmt,
    },

    typst = {
      function()
        return {
          exe = "typstfmt",
          stdin = true,
        }
      end,
    },

    json = {
      function()
        return {
          exe = "jq",
          stdin = true,
        }
      end,
    },

    xml = {
      function()
        return {
          exe = "xmlformat",
          stdin = true,
        }
      end,
    },

    yaml = {
      require("formatter.filetypes.yaml").yamlfmt,
    },

    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
      function()
        -- Ignore already configured types.
        local defined_types = require("formatter.config").values.filetype
        if defined_types[vim.bo.filetype] ~= nil then
          return nil
        end
        vim.lsp.buf.format({ async = true })
      end,
    },
  },
})
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, { pattern = "*", command = ":FormatWrite" })

-- TextCase.
require("textcase").setup()

-- Peepsight.
require("peepsight").setup()

-- Range highlight.
require("range-highlight").setup()

-- Decorated yank.
require("decorated_yank").setup()

-- Markdown
require("render-markdown").setup({
  code = {
    style = "normal",
    above = "─",
    below = "─",
  },
  completions = { lsp = { enabled = true } },
})

-- Namu.
local default_namu_config = {
  window = {
    border = "single",
    title_prefix = " ",
  },
  icon = " ",
  row_position = "center_right",
  auto_select = true,
  movement = {
    next = { "<M-j>" },
    previous = { "<M-k>" },
    delete_word = { "<C-w>" },
    clear_line = { "<C-u>" },
  },
}

require("namu").setup({
  workspace = {
    options = default_namu_config,
  },
  callhierarchy = {
    options = default_namu_config,
  },
  watchtower = {
    options = default_namu_config,
  },
})
