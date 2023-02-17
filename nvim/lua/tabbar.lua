require("util")
require("bufferline").setup({
    animation = false,
    auto_hide = true,
    closable = true,
    clickable = true,
    icon_close_tab = '󰅖',
})
SetKeyMap("<s-left>", "<Cmd>BufferPrevious<cr>")
SetKeyMap("<s-right>", "<Cmd>BufferNext<cr>")
SetKeyMap("<c-x><c-q>", "<Cmd>BufferClose<cr>")
SetKeyMap("<c-x><c-p>", "<Cmd>BufferPin<cr>")
SetKeyMap("<c-x><c-n>", "<Cmd>tabnew<cr>")
