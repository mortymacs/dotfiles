require("util")
require("bufferline").setup({
    animation = false,
    auto_hide = true,
    closable = true,
    clickable = true,
    icon_close_tab = '󰅖',
})
require("scope").setup()
SetKeyMap("<s-left>",   "<Cmd>bprevious<cr>")
SetKeyMap("<s-right>",  "<Cmd>bnext<cr>")
SetKeyMap("<c-right>",  "<Cmd>tabnext<cr>")
SetKeyMap("<c-left>",   "<Cmd>tabprevious<cr>")
SetKeyMap("<c-t>",      "<Cmd>tabnew<cr>")
SetKeyMap("<c-n>",      "<Cmd>new<cr>")
SetKeyMap("<c-x><c-q>", "<Cmd>BufferClose<cr>")
SetKeyMap("<c-x><c-p>", "<Cmd>BufferPin<cr>")
SetKeyMap("<c-x><c-n>", "<Cmd>tabnew<cr>")
