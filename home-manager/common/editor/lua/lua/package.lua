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
    branch = "v3.x",
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
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
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
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      "haringsrob/nvim_context_vt",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "HiPhish/rainbow-delimiters.nvim",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
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
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.nvim",
    },
    file_types = { "markdown" },
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
  {
    "nvzone/minty",
    dependencies = {
      "nvzone/volt",
    },
    cmd = { "Shades", "Huefy" },
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
  -- -- Typst.
  {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    version = "1.*",
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
      "nvim-neotest/nvim-nio",
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
  {
    "nvzone/showkeys",
    cmd = "ShowkeysToggle",
    event = "VeryLazy",
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
