-- Enable treesitter highlighting (built-in in Neovim 0.12+).
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    if vim.bo[args.buf].filetype == "text" then
      return
    end
    pcall(vim.treesitter.start)
  end,
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

-- Surround.
require("nvim-surround").setup()

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
            "--style=file:/home/mort/.config/clangd/clang-format",
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
            "--style=file:/home/mort/.config/clangd/clang-format",
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

-- TextCase.
require("textcase").setup()

-- Range highlight.
require("range-highlight").setup()

-- Decorated yank.
require("decorated_yank").setup()

-- Markdown
require("render-markdown").setup({
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

-- Mini.
local spec_treesitter = require("mini.ai").gen_spec.treesitter
require("mini.ai").setup({
  custom_textobjects = {
    f = spec_treesitter({ a = "@function.outer", i = "@function.inner" }),
    c = spec_treesitter({ a = "@class.outer", i = "@class.inner" }),
    p = spec_treesitter({ a = "@parameter.outer", i = "@parameter.inner" }),
  },
})
require("mini.surround").setup()
