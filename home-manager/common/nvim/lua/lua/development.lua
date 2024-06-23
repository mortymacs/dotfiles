-- Treesitter setup.
require("nvim-treesitter.configs").setup({
  ensure_installed = {
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
        ["<c-c><down>"] = "@function.inner",
        ["<c-c><right>"] = "@parameter.inner",
      },
      goto_previous = {
        ["<c-c><up>"] = "@function.inner",
        ["<c-c><left>"] = "@parameter.inner",
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

-- Whichkey.
require("which-key").setup({
  window = {
    border = "single",
  },
})

-- Spaces.
require("numb").setup()
require("trim").setup()

-- Hlslens.
require("hlslens").setup()

-- Lint.
local lint = require("lint")
local golangcilint = require("lint.linters.golangcilint")
table.insert(golangcilint.args, "--enable-all")
table.insert(golangcilint.args, "--disable=depguard")
table.insert(golangcilint.args, "--gci.custom-order=standard,blank,custom,blank,default,blank,localmodule")
lint.linters_by_ft = {
  go = { "golangcilint", "revive" },
  python = { "ruff" },
  lua = { "luacheck" },
  vala = { "vala_lint" },
  sh = { "shellcheck" },
  sql = { "sqlfluff" },
  nix = { "nix" },
  yaml = { "yamllint" },
  json = { "jsonlint" },
  terraform = { "tfsec" },
}
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

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

-- Deadcolumn.
require("deadcolumn").setup({
  warning = {
    colorcode = "#f94144",
  },
})

-- Formatter.
local util = require("formatter.util")
require("formatter").setup({
  logging = true,
  log_level = vim.log.levels.ERROR,
  filetype = {
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
      require("formatter.filetypes.go").gofumpt,
      require("formatter.filetypes.go").golines,
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

-- Zen mode.
require("twilight").setup()
require("zen-mode").setup({
  window = {
    width = 1,
    options = {
      signcolumn = "no",
      number = false,
      foldcolumn = "0",
      cursorline = false,
      cursorcolumn = false,
    },
  },
  plugins = {
    alacritty = {
      enabled = true,
      font = "25",
    },
  },
})
