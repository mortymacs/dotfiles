-- Setup Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Packages.
require("lazy").setup({
  -- Theme.
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    dependencies = {
      "mvllow/modes.nvim",
    },
  },

  -- CMD.
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  -- Tabbar.
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- Statusbar.
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "lewis6991/gitsigns.nvim",
    },
  },

  -- Finder.
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "tom-anders/telescope-vim-bookmarks.nvim",
      "MattesGroeger/vim-bookmarks",
      "debugloop/telescope-undo.nvim",
      "Marskey/telescope-sg",
      "nvim-telescope/telescope-live-grep-args.nvim",
      "nvim-telescope/telescope-ghq.nvim",
    },
    event = "VeryLazy",
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
  },
  {
    "kevinhwang91/nvim-hlslens",
    event = "VeryLazy",
  },

  -- Git.
  "lewis6991/gitsigns.nvim",
  "sindrets/diffview.nvim",

  -- Development.
  {
    "bassamsdata/namu.nvim",
    event = "VeryLazy",
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-go",
    },
    event = "VeryLazy",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      "haringsrob/nvim_context_vt",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "HiPhish/rainbow-delimiters.nvim",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    build = function()
      vim.cmd(":TSUpdate")
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
  },
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
  },
  {
    "hedyhli/outline.nvim",
    event = { "VeryLazy", "LspAttach" },
  },
  {
    "mhartington/formatter.nvim",
    event = { "LspAttach", "LspAttach" },
  },
  {
    "cappyzawa/trim.nvim",
    event = "VeryLazy",
  },
  "brenoprata10/nvim-highlight-colors",
  "echasnovski/mini.nvim",
  {
    "nacro90/numb.nvim",
    event = "VeryLazy",
  },
  {
    "Wansmer/treesj",
    event = { "VeryLazy", "LspAttach" },
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
  },
  "johmsalas/text-case.nvim",
  "koenverburg/peepsight.nvim",
  {
    "winston0410/range-highlight.nvim",
    dependencies = {
      "winston0410/cmd-parser.nvim",
    },
  },
  {
    "simondrake/decorated_yank",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "folke/zen-mode.nvim",
    dependencies = {
      "folke/twilight.nvim",
    },
    event = "VeryLazy",
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.nvim",
    },
    file_types = { "markdown", "Avante" },
    event = "VeryLazy",
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
  },
  {
    "machakann/vim-sandwich",
    event = "VeryLazy",
  },

  -- LSP.
  "neovim/nvim-lspconfig",
  "onsails/lspkind.nvim",
  {
    "saghen/blink.cmp",
    version = "1.*",
  },
  {
    "Wansmer/symbol-usage.nvim",
    event = "LspAttach",
  },
  {
    "chrisgrieser/nvim-lsp-endhints",
    event = "LspAttach",
    opts = {},
  },
  {
    "linrongbin16/lsp-progress.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = "LspAttach",
  },
  -- -- Rust.
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    ft = { "rust", "toml" },
    event = "LspAttach",
  },
  {
    "saecki/crates.nvim",
    tag = "stable",
    ft = { "toml" },
    event = "LspAttach",
  },
  -- -- Go.
  {
    "fatih/vim-go",
    ft = { "go" },
  },
  -- -- Lua.
  {
    "folke/neodev.nvim",
    ft = { "lua " },
  },
  {
    "rafcamlet/nvim-luapad",
    ft = { "lua" },
  },
  -- -- Terraform
  {
    "hashivim/vim-terraform",
    ft = { "terraform" },
  },
  -- -- JSON/YAML.
  {
    "b0o/schemastore.nvim",
    ft = { "yaml", "json" },
  },

  -- Quickfix.
  "kevinhwang91/nvim-bqf",
  "ashfinal/qfview.nvim",
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Debug.
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "jonboh/nvim-dap-rr",
    },
    event = "VeryLazy",
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-treesitter/nvim-treesitter",
    },
    event = "VeryLazy",
  },

  -- Keybinding.
  "folke/which-key.nvim",
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Large files.
  "LunarVim/bigfile.nvim",

  -- Nerd Icon.
  {
    "2kabhishek/nerdy.nvim",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-telescope/telescope.nvim",
    },
    event = "VeryLazy",
    cmd = "Nerdy",
  },

  -- AI.
  {
    "jackMort/ChatGPT.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim",
    },
    event = "VeryLazy",
  },
  {
    "sourcegraph/sg.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "yetone/avante.nvim",
    lazy = false,
    version = false,
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
  },
})
