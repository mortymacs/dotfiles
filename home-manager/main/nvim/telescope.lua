-- Telescope
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

-- Plugins
require('telescope').load_extension('vim_bookmarks')
require('telescope').load_extension('dap')
