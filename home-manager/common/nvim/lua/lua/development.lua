-- Neotest.
--require("neotest").setup({
--    adapters = {
--        require("neotest-python")({
--
--        }),
--})

-- Treesitter setup.
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c",
    "cpp",
    "go",
    "python",
    "lua",
    "bash",
    "make",
    "sql",
    "latex",
    "markdown",
    "dockerfile",
    "hcl",
    "json",
    "yaml",
    "toml",
    "html",
    "css",
    "regex",
    "http",
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
require("treesitter-context").setup()
require("nvim_context_vt").setup({
  disable_virtual_lines = true,
  disable_ft = { "markdown", "yaml" },
})

-- Colorizer.
require("colorizer").setup()
vim.api.nvim_create_autocmd("BufWritePost", { pattern = "*", command = ":ColorizerReloadAllBuffers" })

-- Highlight.
require("illuminate").configure({
  filetypes_denylist = { "alpha", "NvimTree" },
})

-- Move lines.
require("mini.move").setup({
  mappings = {
    left = "",
    right = "",
    down = "<s-m-down>",
    up = "<s-m-up>",
    line_left = "",
    line_right = "",
    line_down = "<s-m-down>",
    line_up = "<s-m-up>",
  },
})

-- Indentation.
require("mini.indentscope").setup({
  draw = {
    animation = require("mini.indentscope").gen_animation.none(),
  },
  symbol = "│",
})
vim.api.nvim_create_autocmd(
  "FileType",
  { pattern = { "alpha", "NvimTree", "floaterm", "Trouble" }, command = ":lua vim.b.miniindentscope_disable=true" }
)

-- Todo.
require("todo-comments").setup({ signs = false })

-- Whichkey.
require("which-key").setup()

-- Spaces.
require("numb").setup()
require("trim").setup()

-- Hlslens.
require("hlslens").setup()

-- Lint.
local lint = require("lint")
lint.linters_by_ft = {
  go = { "golangcilint", "revive" },
  python = { "ruff" },
  lua = { "luacheck" },
  sh = { "shellcheck" },
  sql = { "sqlfluff" },
  nix = { "nix" },
  yaml = { "yamllint" },
  json = { "jsonlint" },
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
        for k, v in pairs(defined_types) do
          if vim.bo.filetype == k then
            return nil
          end
        end
        vim.lsp.buf.format({ async = true })
      end,
    },
  },
})
vim.api.nvim_create_autocmd({ "BufWritePost" }, { pattern = "*", command = ":FormatWrite" })
