-- DAP highlights.
require("nvim-dap-repl-highlights").setup()

-- Treesitter setup.
require('nvim-treesitter.configs').setup({
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
        "dap_repl",
    },
    sync_install = true,
    auto_install = true,
    highlight = {
        enable = true,
    },
})

-- Treesitter plugins.
require("treesitter-context").setup()

-- Colorizer.
require('colorizer').setup()
vim.api.nvim_create_autocmd("BufWritePost", { pattern = "*", command = ":ColorizerReloadAllBuffers" })

-- Highlight.
require('illuminate').configure({
    filetypes_denylist = { "alpha", "NvimTree" },
})

-- Move lines.
require('mini.move').setup({
    mappings = {
        left = '',
        right = '',
        down = '<s-m-down>',
        up = '<s-m-up>',
        line_left = '',
        line_right = '',
        line_down = '<s-m-down>',
        line_up = '<s-m-up>',
    },
})

-- Indentation.
require('mini.indentscope').setup({
    draw = {
        animation = require('mini.indentscope').gen_animation.none(),
    },
    symbol = "│",
})
vim.api.nvim_create_autocmd("FileType",
    { pattern = { "alpha", "NvimTree", "floaterm" }, command = ":lua vim.b.miniindentscope_disable=true" })

-- Todo.
require('todo-comments').setup({ signs = false })

-- Whichkey.
require("which-key").setup()

-- Spaces.
require('numb').setup()
require('trim').setup()

-- Hlslens.
require('hlslens').setup()
