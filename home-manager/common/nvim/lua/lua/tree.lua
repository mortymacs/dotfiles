require("neo-tree").setup({
    sources = {
        "filesystem",
        "buffers",
        "git_status",
        "document_symbols",
    },
    add_blank_line_at_top = false,
    auto_clean_after_session_restore = false,
    close_if_last_window = false,
    close_floats_on_escape_key = true,
    default_source = "filesystem",
    enable_diagnostics = true,
    enable_git_status = true,
    enable_modified_markers = true,
    enable_opened_markers = true,
    enable_refresh_on_write = true,
    git_status_async = true,
    git_status_async_options = {
        batch_size = 1000,
        batch_delay = 10,
        max_lines = 10000,
    },
    hide_root_node = true,
    retain_hidden_root_indent = false,
    log_level = "error",
    log_to_file = false,
    open_files_in_last_window = true,
    open_files_do_not_replace_types = { "terminal", "qf" },
    popup_border_style = "single",
    resize_timer_interval = 500,
    sort_case_insensitive = false,
    sort_function = nil,
    use_popups_for_input = true,
    use_default_mappings = true,
    source_selector = {
        winbar = false,
        statusline = false,
        show_scrolled_off_parent_node = false,
        sources = {
            {
                source = "filesystem",
                display_name = " 󰉕 Files ",
            },
            {
                source = "buffers",
                display_name = "  Buffers ",
            },
            {
                source = "git_status",
                display_name = "  Git "
            },
            {
                source = "document_symbols",
                display_name = "  Symbols "
            },
        },
        content_layout = "start",
        tabs_layout = "equal",
        truncation_character = "…",
        tabs_min_width = nil,
        tabs_max_width = nil,
        padding = 0,
        separator = { left = "▏", right = "▕" },
        separator_active = nil,
        show_separator_on_edge = false,
        highlight_tab = "NeoTreeTabInactive",
        highlight_tab_active = "NeoTreeTabActive",
        highlight_background = "NeoTreeTabInactive",
        highlight_separator = "NeoTreeTabSeparatorInactive",
        highlight_separator_active = "NeoTreeTabSeparatorActive",
    },
    default_component_configs = {
        container = {
            enable_character_fade = true,
            width = "100%",
            right_padding = 0,
        },
        diagnostics = {
            symbols = {
                hint = "󰸥",
                info = "󰵚",
                warn = "",
                error = "",
            },
            highlights = {
                hint = "DiagnosticSignHint",
                info = "DiagnosticSignInfo",
                warn = "DiagnosticSignWarn",
                error = "DiagnosticSignError",
            },
        },
        indent = {
            indent_size = 2,
            padding = 1,
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "NeoTreeIndentMarker",
            with_expanders = nil,
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
        },
        icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
            folder_empty_open = "",
            default = "*",
            highlight = "NeoTreeFileIcon"
        },
        modified = {
            symbol = "[+] ",
            highlight = "NeoTreeModified",
        },
        name = {
            trailing_slash = false,
            highlight_opened_files = false,
            use_git_status_colors = false,
            highlight = "NeoTreeFileName",
        },
        git_status = {
            symbols = {
                -- Change type
                added     = "",
                deleted   = "",
                modified  = "",
                renamed   = "",
                -- Status type
                untracked = "",
                ignored   = "",
                unstaged  = "",
                staged    = "",
                conflict  = "",
            },
            align = "right",
        },
    },
    renderers = {
        directory = {
            { "indent" },
            { "icon" },
            { "current_filter" },
            {
                "container",
                content = {
                    { "name", zindex = 10 },
                    { "clipboard", zindex = 10 },
                    { "diagnostics", errors_only = true, zindex = 20, align = "right", hide_when_expanded = true },
                    { "git_status", zindex = 20, align = "right", hide_when_expanded = true },
                },
            },
        },
        file = {
            { "indent" },
            { "icon" },
            {
                "container",
                content = {
                    {
                        "name",
                        zindex = 10
                    },
                    { "clipboard", zindex = 10 },
                    { "bufnr", zindex = 10 },
                    { "modified", zindex = 20, align = "right" },
                    { "diagnostics", zindex = 20, align = "right" },
                    { "git_status", zindex = 20, align = "right" },
                },
            },
        },
        message = {
            { "indent", with_markers = false },
            { "name", highlight = "NeoTreeMessage" },
        },
        terminal = {
            { "indent" },
            { "icon" },
            { "name" },
            { "bufnr" }
        }
    },
    nesting_rules = {},
    commands = {},
    window = { -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup for
        position = "left", -- left, right, top, bottom, float, current
        width = 30, -- applies to left and right positions
        height = 15, -- applies to top and bottom positions
        auto_expand_width = false, -- expand the window when file exceeds the window width. does not work with position = "float"
        popup = { -- settings that apply to float position only
            size = {
                height = "80%",
                width = "50%",
            },
            position = "50%", -- 50% means center it
        },
        same_level = false, -- Create and paste/move files/directories on the same level as the directory under cursor (as opposed to within the directory under cursor).
        insert_as = "child", -- Affects how nodes get inserted into the tree during creation/pasting/moving of files if the node under the cursor is a directory:
        mapping_options = {
            noremap = true,
            nowait = true,
        },
        mappings = {
            ["<space>"] = {
                "toggle_node",
                nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
            },
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["<esc>"] = "revert_preview",
            ["P"] = { "toggle_preview", config = { use_float = true } },
            ["l"] = "focus_preview",
            ["S"] = "open_split",
            -- ["S"] = "split_with_window_picker",
            ["s"] = "open_vsplit",
            -- ["s"] = "vsplit_with_window_picker",
            ["t"] = "open_tabnew",
            -- ["<cr>"] = "open_drop",
            -- ["t"] = "open_tab_drop",
            ["w"] = "open_with_window_picker",
            ["C"] = "close_node",
            ["z"] = "close_all_nodes",
            --["Z"] = "expand_all_nodes",
            ["R"] = "refresh",
            ["a"] = {
                "add",
                -- some commands may take optional config options, see `:h neo-tree-mappings` for details
                config = {
                    show_path = "none", -- "none", "relative", "absolute"
                }
            },
            ["A"] = "add_directory", -- also accepts the config.show_path and config.insert_as options.
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy", -- takes text input for destination, also accepts the config.show_path and config.insert_as options
            ["m"] = "move", -- takes text input for destination, also accepts the config.show_path and config.insert_as options
            ["e"] = "toggle_auto_expand_width",
            ["q"] = "close_window",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
        },
    },
    filesystem = {
        window = {
            mappings = {
                ["H"] = "toggle_hidden",
                ["/"] = "fuzzy_finder",
                ["D"] = "fuzzy_finder_directory",
                --["/"] = "filter_as_you_type", -- this was the default until v1.28
                ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
                -- ["D"] = "fuzzy_sorter_directory",
                ["f"] = "filter_on_submit",
                ["<C-x>"] = "clear_filter",
                ["<bs>"] = "navigate_up",
                ["."] = "set_root",
                ["[g"] = "prev_git_modified",
                ["]g"] = "next_git_modified",
            },
            fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
                ["<down>"] = "move_cursor_down",
                ["<C-n>"] = "move_cursor_down",
                ["<up>"] = "move_cursor_up",
                ["<C-p>"] = "move_cursor_up",
            },
        },
        async_directory_scan = "auto", -- "auto"   means refreshes are async, but it's synchronous when called from the Neotree commands.
        scan_mode = "shallow", -- "shallow": Don't scan into directories to detect possible empty directory a priori
        bind_to_cwd = true, -- true creates a 2-way binding between vim's cwd and neo-tree's root
        cwd_target = {
            sidebar = "tab", -- sidebar is when position = left or right
            current = "window" -- current is when position = current
        },
        filtered_items = {
            visible = false,
            force_visible_in_empty_folder = false,
            show_hidden_count = true,
            hide_dotfiles = false,
            hide_gitignored = true,
            hide_hidden = true,
            hide_by_name = {
                ".venv",
                ".git",
                "vendor",
            },
            always_show = {
                ".gitignore",
                ".github",
                ".gitlab-ci.yml",
            },
        },
        find_by_full_path_words = false,
        group_empty_dirs = false,
        search_limit = 50,
        follow_current_file = false,
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = true,
    },
    buffers = {
        bind_to_cwd = true,
        follow_current_file = true,
        group_empty_dirs = true,
        show_unloaded = false,
        window = {
            mappings = {
                ["<bs>"] = "navigate_up",
                ["."] = "set_root",
                ["bd"] = "buffer_delete",
            },
        },
    },
    git_status = {
        window = {
            mappings = {
                ["A"] = "git_add_all",
                ["gu"] = "git_unstage_file",
                ["ga"] = "git_add_file",
                ["gr"] = "git_revert_file",
                ["gc"] = "git_commit",
                ["gp"] = "git_push",
                ["gg"] = "git_commit_and_push",
            },
        },
    },
    document_symbols = {
        kinds = {
            Unknown = { icon = "?", hl = "" },
            Root = { icon = "", hl = "NeoTreeRootName" },
            File = { icon = "󰈙", hl = "Tag" },
            Module = { icon = "", hl = "Exception" },
            Namespace = { icon = "", hl = "Include" },
            Package = { icon = "󰏗", hl = "Label" },
            Class = { icon = "󰠱", hl = "Include" },
            Method = { icon = "󰊕", hl = "Function" },
            Property = { icon = "󰜢", hl = "@property" },
            Field = { icon = "󰜢", hl = "@field" },
            Constructor = { icon = "󰩀", hl = "@constructor" },
            Enum = { icon = "", hl = "@number" },
            Interface = { icon = "", hl = "Type" },
            Function = { icon = "󰊕", hl = "Function" },
            Variable = { icon = "󰀫", hl = "@variable" },
            Constant = { icon = "󰏿", hl = "Constant" },
            -- Data type.
            String = { icon = "󰉿", hl = "String" },
            Number = { icon = "", hl = "Number" },
            Boolean = { icon = "", hl = "Boolean" },
            Array = { icon = "󱒅", hl = "Type" },
            Object = { icon = "", hl = "Type" },
            Key = { icon = "", hl = "" },
            Null = { icon = "󰟢", hl = "Constant" },
            EnumMember = { icon = "", hl = "Number" },
            Struct = { icon = "", hl = "Type" },
            Event = { icon = "", hl = "Constant" },
            Operator = { icon = "", hl = "Operator" },
            TypeParameter = { icon = "󰩀", hl = "Type" },
        }
    },
    example = {
        renderers = {
            custom = {
                { "indent" },
                { "icon", default = "C" },
                { "custom" },
                { "name" }
            }
        },
        window = {
            mappings = {
                ["<cr>"] = "toggle_node",
                ["<C-e>"] = "example_command",
                ["d"] = "show_debug_info",
            },
        },
    },
})
