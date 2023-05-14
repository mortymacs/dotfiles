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
        "pineapplegiant/spaceduck",
        branch = "main",
    },
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
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    "junegunn/fzf",
    "junegunn/fzf.vim",
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            "tom-anders/telescope-vim-bookmarks.nvim",
            "MattesGroeger/vim-bookmarks",
            "debugloop/telescope-undo.nvim",
            "FeiyouG/command_center.nvim",
        },
    },

    -- Terminal.
    {
        "akinsho/toggleterm.nvim",
        version = "*",
    },

    -- Git
    "ruanyl/vim-gh-line",
    "f-person/git-blame.nvim",
    "aaronhallaert/advanced-git-search.nvim",
    "lewis6991/gitsigns.nvim",

    -- Development.
    "norcalli/nvim-colorizer.lua",
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            vim.cmd(":TSUpdate")
        end,
    },
    "nvim-treesitter/nvim-treesitter-context",
    {
        "folke/todo-comments.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    "cappyzawa/trim.nvim",
    "nacro90/numb.nvim",
    "RRethy/vim-illuminate",
    "kevinhwang91/nvim-hlslens",
    "echasnovski/mini.nvim",
    "Wansmer/treesj",

    -- LSP.
    "neovim/nvim-lspconfig",
    "folke/neodev.nvim",
    "onsails/lspkind.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "dnlhc/glance.nvim",
    {
        "glepnir/lspsaga.nvim",
        branch = "main",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    "VidocqH/lsp-lens.nvim",
    "hrsh7th/vim-vsnip",
    "preservim/tagbar",
    "terrortylor/nvim-comment",
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
    -- -- Trouble
    {
        "folke/trouble.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",

    -- Debug.
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
    },

    -- Keybinding.
    "folke/which-key.nvim",
})
