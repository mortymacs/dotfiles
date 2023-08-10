-- Setup.
require("telescope").setup({
    defaults = {
        layout_strategy = 'vertical',
        borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        vimgrep_arguments = {
            "rg",
            "-L",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    },
    pickers = {
        find_files = {
            borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        },
    },
    extensions = {
        command_palette = {
            { "File",
                { "entire selection (C-a)",  ':call feedkeys("GVgg")' },
                { "save current file (C-s)", ':w' },
                { "save all files (C-A-s)",  ':wa' },
                { "quit (C-q)",              ':qa' },
                { "file browser (C-i)",      ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
                { "search word (A-w)",       ":lua require('telescope.builtin').live_grep()",                  1 },
                { "git files (A-f)",         ":lua require('telescope.builtin').git_files()",                  1 },
                { "files (C-f)",             ":lua require('telescope.builtin').find_files()",                 1 },
            },
            { "Help",
                { "tips",            ":help tips" },
                { "cheatsheet",      ":help index" },
                { "tutorial",        ":help tutor" },
                { "summary",         ":help summary" },
                { "quick reference", ":help quickref" },
                { "search help(F1)", ":lua require('telescope.builtin').help_tags()", 1 },
            },
            { "NVim",
                { "update packages",           ":Lazy! sync" },
                { "reload vimrc",              ":source $MYVIMRC" },
                { 'check health',              ":checkhealth" },
                { "jumps (Alt-j)",             ":lua require('telescope.builtin').jumplist()" },
                { "commands",                  ":lua require('telescope.builtin').commands()" },
                { "command history",           ":lua require('telescope.builtin').command_history()" },
                { "registers (A-e)",           ":lua require('telescope.builtin').registers()" },
                { "colorshceme",               ":lua require('telescope.builtin').colorscheme()",    1 },
                { "vim options",               ":lua require('telescope.builtin').vim_options()" },
                { "keymaps",                   ":lua require('telescope.builtin').keymaps()" },
                { "buffers",                   ":Telescope buffers" },
                { "search history (C-h)",      ":lua require('telescope.builtin').search_history()" },
                { "paste mode",                ':set paste!' },
                { 'cursor line',               ':set cursorline!' },
                { 'cursor column',             ':set cursorcolumn!' },
                { "spell checker",             ':set spell!' },
                { "relative number",           ':set relativenumber!' },
                { "search highlighting (F12)", ':set hlsearch!' },
            },
        },
        ast_grep = {
            command = {
                "ast-grep",
                "--json=stream",
                "-p",
            },
            grep_open_files = false,
            lang = nil,
        },
    },
})

-- Plugins.
require("telescope").load_extension("vim_bookmarks")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("yaml_schema")
require("telescope").load_extension("undo")
require("telescope").load_extension("command_center")
require("telescope").load_extension("advanced_git_search")
require("telescope").load_extension("command_palette")
require("telescope").load_extension("ast_grep")
-- require('telescope').load_extension('dap')
