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
  "ayu-theme/ayu-vim",
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

  -- Sidebar.
  "luukvbaal/statuscol.nvim",

  -- Notification.
  "rcarriga/nvim-notify",

  -- Cmd.
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "AckslD/muren.nvim",
    config = true,
  },
  "LinArcX/telescope-command-palette.nvim",

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
  "junegunn/fzf",
  "junegunn/fzf.vim",
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ghq.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "tom-anders/telescope-vim-bookmarks.nvim",
      "MattesGroeger/vim-bookmarks",
      "debugloop/telescope-undo.nvim",
      "FeiyouG/command_center.nvim",
      "Marskey/telescope-sg",
    },
  },

  -- Terminal.
  {
    "akinsho/toggleterm.nvim",
    version = "*",
  },

  -- Git.
  "ruanyl/vim-gh-line",
  "f-person/git-blame.nvim",
  "aaronhallaert/advanced-git-search.nvim",
  "lewis6991/gitsigns.nvim",
  "sindrets/diffview.nvim",
  {
    "wintermute-cell/gitignore.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "NeogitOrg/neogit",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
  },

  -- Development.
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      vim.cmd(":TSUpdate")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "haringsrob/nvim_context_vt",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "ray-x/cmp-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  "mhartington/formatter.nvim",
  "cappyzawa/trim.nvim",
  "norcalli/nvim-colorizer.lua",
  "RRethy/vim-illuminate",
  "kevinhwang91/nvim-hlslens",
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
  "petertriho/nvim-scrollbar",

  -- LSP.
  "neovim/nvim-lspconfig",
  "folke/neodev.nvim",
  "onsails/lspkind.nvim",
  "simrat39/symbols-outline.nvim",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp",
  "ray-x/lsp_signature.nvim",
  "dnlhc/glance.nvim",
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "gfanto/fzf-lsp.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  "VidocqH/lsp-lens.nvim",
  "lvimuser/lsp-inlayhints.nvim",
  "hrsh7th/vim-vsnip",
  "preservim/tagbar",
  "terrortylor/nvim-comment",
  "smjonas/inc-rename.nvim",
  -- -- Go.
  "fatih/vim-go",
  -- -- Lua.
  "hrsh7th/cmp-nvim-lua",
  "rafcamlet/nvim-luapad",
  -- -- Terraform
  "hashivim/vim-terraform",
  -- -- YAML.
  "someone-stole-my-name/yaml-companion.nvim",
  -- -- RG.
  "lukas-reineke/cmp-rg",
  -- -- Path.
  "hrsh7th/cmp-path",

  -- Quickfix.
  "kevinhwang91/nvim-bqf",
  "ashfinal/qfview.nvim",
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- Debug.
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-treesitter/nvim-treesitter",
    },
  },

  -- Keybinding.
  "folke/which-key.nvim",
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Auto save.
  -- "Pocco81/auto-save.nvim",
})
