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
  "Shatur/neovim-ayu",
  "projekt0n/github-nvim-theme",
  "mvllow/modes.nvim",

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

  -- UI.
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
  },

  -- Splash screen.
  {
    "goolord/alpha-nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
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
    "junegunn/fzf",
    "junegunn/fzf.vim",
    event = "VeryLazy",
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
    "folke/flash.nvim",
    event = "VeryLazy",
  },
  {
    "kevinhwang91/nvim-hlslens",
    event = "VeryLazy",
  },

  -- Git.
  "ruanyl/vim-gh-line",
  "aaronhallaert/advanced-git-search.nvim",
  "lewis6991/gitsigns.nvim",
  "sindrets/diffview.nvim",
  {
    "wintermute-cell/gitignore.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    event = "VeryLazy",
  },

  -- Development.
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
    event = "VeryLazy",
  },
  "mhartington/formatter.nvim",
  "cappyzawa/trim.nvim",
  "brenoprata10/nvim-highlight-colors",
  "echasnovski/mini.nvim",
  "nacro90/numb.nvim",
  "Wansmer/treesj",
  "mfussenegger/nvim-lint",
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
  },
  "Bekaboo/deadcolumn.nvim",
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
    "hrsh7th/cmp-nvim-lsp",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
    },
    event = "LspAttach",
  },
  {
    "ray-x/lsp_signature.nvim",
    opts = {},
    event = "LspAttach",
  },
  {
    "dnlhc/glance.nvim",
    event = "LspAttach",
  },
  {
    "gfanto/fzf-lsp.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "LspAttach",
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
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
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
  },
  {
    "saecki/crates.nvim",
    tag = "stable",
  },
  -- -- Go.
  {
    "fatih/vim-go",
    ft = { "go" },
    init = function()
      vim.g.go_echo_command_info = 0
    end,
  },
  -- -- Lua.
  {
    "folke/neodev.nvim",
    ft = { "lua " },
  },
  {
    "hrsh7th/cmp-nvim-lua",
    ft = { "lua" },
    event = "LspAttach",
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

  -- Fold.
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    event = "VeryLazy",
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
