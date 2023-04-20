-- Setup.
require("telescope").setup({
    defaults = {
        layout_strategy = 'vertical',
        borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    },
    pickers = {
        find_files = {
            borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        },
    },
})

-- Plugins.
require('telescope').load_extension("vim_bookmarks")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("yaml_schema")
require("telescope").load_extension("undo")
require("telescope").load_extension("command_center")
-- require('telescope').load_extension('dap')
