-- Setup Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Packages
require("lazy").setup({
    -- Theme
    {
        "pineapplegiant/spaceduck",
        branch = "main",
    },
    "projekt0n/github-nvim-theme",
    "vv9k/bogster",
    "norcalli/nvim-colorizer.lua",
    "mvllow/modes.nvim",

    -- Tabbar
    {
        "romgrk/barbar.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    "tiagovla/scope.nvim",

    -- Statusbar
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

    -- Cmd
    {
        "folke/noice.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    },

    -- Notification
    "rcarriga/nvim-notify",

    -- Splash screen
    {
        "goolord/alpha-nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            vim.cmd(":TSUpdate")
        end,
    },
    "nvim-treesitter/nvim-treesitter-context",

    -- File Manager
    {
        "nvim-tree/nvim-tree.lua",
        tag = "nightly",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    "nvim-telescope/telescope-file-browser.nvim",

    -- FZF
    "junegunn/fzf",
    "junegunn/fzf.vim",

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    -- Terminal
    "voldikss/vim-floaterm",

    -- Trouble
    {
        "folke/trouble.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

    -- Development
    "editorconfig/editorconfig-vim",
    {
        "npxbr/glow.nvim",
        ft = { "markdown" },
    },
    "RRethy/vim-illuminate",
    "arkav/lualine-lsp-progress",
    {
        "folke/todo-comments.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    "cljoly/telescope-repo.nvim",

    -- Debug
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
    },

    -- LSP
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
    "onsails/lspkind.nvim",
    "ray-x/lsp_signature.nvim",
    "lukas-reineke/cmp-rg",
    "folke/neodev.nvim",
    "dnlhc/glance.nvim",
    {
        "glepnir/lspsaga.nvim",
        branch = "main",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    "VidocqH/lsp-lens.nvim",
    "gfanto/fzf-lsp.nvim",

    -- Lua
    "hrsh7th/cmp-nvim-lua",

    -- Rust
    "simrat39/rust-tools.nvim",
    {
        "saecki/crates.nvim",
        event = "BufRead Cargo.toml",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    },

    -- Go
    -- "fatih/vim-go",
    "ray-x/go.nvim",
    "ray-x/guihua.lua",

    -- Terraform
    "hashivim/vim-terraform",

    -- YAML
    {
        "someone-stole-my-name/yaml-companion.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
    },

    -- Markdown
    {
        "iamcco/markdown-preview.nvim",
        config = function()
            vim.cmd(":call mkdp#util#install()")
        end,
    },

    -- Text
    "echasnovski/mini.nvim",
    "ggandor/leap.nvim",
    "AckslD/nvim-neoclip.lua",

    -- Tag
    "preservim/tagbar",

    -- Comment
    "terrortylor/nvim-comment",

    -- Git
    "lewis6991/gitsigns.nvim",
    "ruanyl/vim-gh-line",
    "f-person/git-blame.nvim",

    -- Orgmode
    "nvim-orgmode/orgmode",

    -- History
    "mbbill/undotree",

    -- Bookmark
    "MattesGroeger/vim-bookmarks",
    "tom-anders/telescope-vim-bookmarks.nvim",

    -- Keybinding
    "mrjones2014/legendary.nvim",
    "folke/which-key.nvim",

    -- Misc
    "cappyzawa/trim.nvim",
    "nacro90/numb.nvim",
})
