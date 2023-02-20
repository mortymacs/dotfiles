vim.g.floaterm_title = "$0/$2"
vim.g.floaterm_height = 0.4
vim.g.floaterm_width = 0.99
vim.g.floaterm_position = "bottom"
vim.g.floaterm_wintype = "float"
vim.g.floaterm_autohide = 1
vim.g.floaterm_keymap_toggle = ""
vim.g.floaterm_keymap_new    = ""
vim.g.floaterm_keymap_prev   = ""
vim.g.floaterm_keymap_next   = ""
vim.g.floaterm_keymap_kill   = ""
vim.g.floaterm_opener = "tabe"
-- https://stackoverflow.com/a/63908546/2338672
vim.api.nvim_create_autocmd("TermOpen", {command = "setlocal nonu nornu signcolumn=no"})
