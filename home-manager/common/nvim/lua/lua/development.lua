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
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V',  -- linewise
                ['@class.outer'] = '<c-v>', -- blockwise
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
            }
        },
    },
})

-- Treesitter plugins.
require("treesitter-context").setup()
require("nvim_context_vt").setup()

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
    { pattern = { "alpha", "NvimTree", "floaterm", "Trouble" }, command = ":lua vim.b.miniindentscope_disable=true" }
)

-- Todo.
require('todo-comments').setup({ signs = false })

-- Whichkey.
require("which-key").setup()

-- Spaces.
require('numb').setup()
require('trim').setup()

-- Hlslens.
require('hlslens').setup()

-- Lint.
require('lint').linters_by_ft = {
    go = { "golangcilint", "revive", },
    lua = { "luacheck", },
    sh = { "shellcheck", },
    sql = { "sqlfluff", },
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
require('deadcolumn').setup({
    warning = {
        colorcode = "#f94144",
    },
})
