require("util")

view = {
    mappings = {
        list = {},
    },
}

local function on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    view.mappings.custom_only = true

    vim.keymap.set('n', '<cr>', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
    vim.keymap.set('n', 'h', api.node.open.horizontal, opts('Open: Horizontal Split'))
    vim.keymap.set('n', '<tab>', api.node.open.preview, opts('Open Preview'))
    vim.keymap.set('n', 'g', api.tree.reload, opts('Refresh'))
    vim.keymap.set('n', 'n', api.fs.create, opts('Create'))
    vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
    vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
    vim.keymap.set('n', 'm', api.fs.cut, opts('Cut'))
    vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
    vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
    vim.keymap.set('n', 'bp', api.marks.bulk.move, opts('Move Bookmarked'))
    vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
    vim.keymap.set('n', 'Y', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
    vim.keymap.set('n', '/', api.live_filter.start, opts('Filter'))
    vim.keymap.set('n', '<c-f>', api.tree.search_node, opts('Search'))
    vim.keymap.set('n', '<c-]>', api.tree.close, opts('Close'))
end

require('nvim-tree').setup({
    on_attach = on_attach,
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    disable_netrw = true,
    hijack_cursor = true,
    filters = {
        custom = { "^\\.git", "^\\.venv" },
    },
    live_filter = {
        prefix = "[FILTER]: ",
        always_show_folders = false,
    },
    git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        timeout = 400,
    },
    view = {
        signcolumn = "no",
    },
    renderer = {
        root_folder_label = false,
        icons = {
            padding = " ",
            show = {
                folder_arrow = true,
            },
            glyphs = {
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "",
                },
            },
        },
        indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                bottom = "─",
                none = " ",
            },
        },
        special_files = { "Makefile", "CMakeLists.txt", "Magefile", "go.mod", "go.sum", "pyproject.toml" },
    },
    actions = {
        open_file = {
            resize_window = false,
        },
    },
})
