vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- Theme
  use {"pineapplegiant/spaceduck", branch = "main"}
  use {"projekt0n/github-nvim-theme"}
  use "norcalli/nvim-colorizer.lua"

  -- Scroll
  use "karb94/neoscroll.nvim"

  -- Tabbar
  use "nvim-tree/nvim-web-devicons"
  use {"romgrk/barbar.nvim", wants = "nvim-web-devicons"}

  -- Statusbar
  use {"nvim-lualine/lualine.nvim", wants = "nvim-web-devicons"}
  use "vimpostor/vim-tpipeline"

  -- Notification
  use "rcarriga/nvim-notify"

  -- Splash screen
  use "mhinz/vim-startify"

  -- Treesitter
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use "nvim-treesitter/nvim-treesitter-context"

  -- File Manager
  use {"nvim-tree/nvim-tree.lua", wants = "nvim-web-devicons", tag = "nightly"}
  use { "nvim-telescope/telescope-file-browser.nvim" }

  -- FZF
  use "junegunn/fzf.vim"

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    requires = { {"nvim-lua/plenary.nvim"} }
  }

  -- Terminal
  use "voldikss/vim-floaterm"

  -- Trouble
  use {"folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons"}

  -- Development
  use "editorconfig/editorconfig-vim"
  use "npxbr/glow.nvim"
  use "RRethy/vim-illuminate"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-vsnip"
  use "hrsh7th/vim-vsnip"
  use "ray-x/lsp_signature.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "lukas-reineke/cmp-rg"
  use {
    "saecki/crates.nvim",
    tag = "*",
    requires = { "nvim-lua/plenary.nvim" },
  }
  use "fatih/vim-go"
  use "dense-analysis/ale"
  use "hashivim/vim-terraform"

  -- YAML
  use {
    "someone-stole-my-name/yaml-companion.nvim",
    requires = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
  }

  -- Markdown
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Tag
  use "preservim/tagbar"

  -- Comment
  use "terrortylor/nvim-comment"

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "f-person/git-blame.nvim"

  -- Orgmode
  use "nvim-orgmode/orgmode"

  -- History
  use "mbbill/undotree"

  -- Bookmark
  use "MattesGroeger/vim-bookmarks"
  use "tom-anders/telescope-vim-bookmarks.nvim"

  -- Keybinding
  use "mrjones2014/legendary.nvim"

  -- Misc
  use "cappyzawa/trim.nvim"
end)