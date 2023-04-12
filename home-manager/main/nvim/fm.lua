require('nvim-tree').setup({
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    disable_netrw = true,
    hijack_cursor = true,
    renderer = {
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
        },
        special_files = { "Makefile", "CMakeLists.txt", "Cargo.toml", "Magefile", "go.mod", "go.sum", "pyproject.toml" },
    },
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
        hide_root_folder = true,
        signcolumn = "no",
        mappings = {
            custom_only = true,
            list = {
                { key = "<cr>",  action = "edit" },
                { key = "v",     action = "vsplit" },
                { key = "h",     action = "split" },
                { key = "<tab>", action = "preview" },
                { key = "g",     action = "refresh" },
                { key = "n",     action = "create" },
                { key = "d",     action = "remove" },
                { key = "r",     action = "rename" },
                { key = "m",     action = "cut" },
                { key = "c",     action = "copy" },
                { key = "p",     action = "paste" },
                { key = "bp",    action = "bulk_move" },
                { key = "y",     action = "copy_name" },
                { key = "Y",     action = "copy_absolute_path" },
                { key = "/",     action = "live_filter" },
                { key = "<c-f>", action = "search_node" },
                { key = "<c-]>", action = "close" },
            },
        },
    },
    renderer = {
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
    },
    actions = {
        open_file = {
            resize_window = false,
        },
    },
})
