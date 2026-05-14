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
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "junegunn/fzf",
    dependencies = {
      "junegunn/fzf.vim",
    },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
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
  "nvim-treesitter/nvim-treesitter-context",
  "haringsrob/nvim_context_vt",
  "HiPhish/rainbow-delimiters.nvim",
  "JoosepAlviste/nvim-ts-context-commentstring",
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
  {
    "nacro90/numb.nvim",
    event = "VeryLazy",
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
  },
  "johmsalas/text-case.nvim",
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
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-mini/mini.nvim",
    },
    file_types = { "markdown" },
    event = "VeryLazy",
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
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
  -- -- Go.
  {
    "fatih/vim-go",
    ft = { "go" },
  },
  -- -- Lua.
  {
    "folke/lazydev.nvim",
    ft = { "lua " },
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
  {
    "terrastruct/d2-vim",
    ft = { "d2" },
  },

  -- Quickfix.
  "kevinhwang91/nvim-bqf",
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- AI.
  {
    "ggml-org/llama.vim",
    event = "LspAttach",
  },

  -- Keybinding.
  "folke/which-key.nvim",
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Nerd Icon.
  {
    "2kabhishek/nerdy.nvim",
    dependencies = {
      "folke/snacks.nvim",
    },
    cmd = "Nerdy",
    opts = {
      use_new_command = true,
    },
  },
})
