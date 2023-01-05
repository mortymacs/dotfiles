require("util")

-- Split and close panes
SetKeyMap("<c-x><c-v>", "<Cmd>vsplit<cr>")
SetKeyMap("<c-x><c-h>", "<Cmd>split<cr>")
SetKeyMap("<c-x><c-c>", "<Cmd>close<cr>")

-- Moving around panes
SetKeyMap("<m-up>",    "<c-w><c-k>")
SetKeyMap("<m-down>",  "<c-w><c-j>")
SetKeyMap("<m-left>",  "<c-w><c-h>")
SetKeyMap("<m-right>", "<c-w><c-l>")

-- Resize panes
SetKeyMap("<c-s-up>",    "<Cmd>resize -1<cr>")
SetKeyMap("<c-s-down>",  "<Cmd>resize +1<cr>")
SetKeyMap("<c-s-left>",  "<Cmd>vertical resize +1<cr>")
SetKeyMap("<c-s-right>", "<Cmd>vertical resize -1<cr>")

-- Buffer
SetKeyMap("<c-x><c-e>", ":Bd!<cr>")
SetKeyMap("<c-f>", "<Cmd>Telescope current_buffer_fuzzy_find<cr>")

-- File and directory
SetKeyMap("<c-x><c-f>", "<Cmd>Files<cr>")
SetKeyMap("<c-x><c-d>", "<Cmd>Telescope file_browser<cr>")
SetKeyMap("<c-x><c-b>", "<Cmd>Buffers<cr>")
SetKeyMap("<c-]>",      "<Cmd>NvimTreeToggle<cr>")

-- Search
SetKeyMap("<c-x><c-g>", "<Cmd>Telescope live_grep<cr>")

-- Git
SetKeyMap("<c-g><c-h>", "<Cmd>Gitsigns preview_hunk_inline<cr>")
SetKeyMap("<c-g><c-u>", "<Cmd>Gitsigns undo_stage_hunk<cr>")
SetKeyMap("<c-g><c-l>", "<Cmd>Gitsigns stage_hunk<cr>")
SetKeyMap("<c-g><c-s>", "<Cmd>Telescope git_status<cr>")
SetKeyMap("<c-g><c-b>", "<Cmd>Telescope git_branches<cr>")
SetKeyMap("<c-g><c-c>", "<Cmd>Telescope git_commits<cr>")
SetKeyMap("<c-g><c-t>", "<Cmd>Telescope git_stash<cr>")

-- History
SetKeyMap("<c-x><c-u>", "<Cmd>UndotreeToggle<cr>")

-- Text
-- other options: v$ v0o$
SetKeyMap("<c-space>", "<esc>v", {"n"})
SetKeyMap("<c-@>",     "<esc>v")
SetKeyMap("<c-d>",     "<esc>yyp")

-- https://stackoverflow.com/a/63887462/2338672
SetKeyMap("<s-m-down>", "<Cmd>m .+1<cr>==",        {"n"})
SetKeyMap("<s-m-up>",   "<Cmd>m .-2<cr>==",        {"n"})
SetKeyMap("<s-m-down>", "<esc><Cmd>m .+1<cr>==gi", {"i"})
SetKeyMap("<s-m-up>",   "<esc><Cmd>m .-2<cr>==gi", {"i"})
vim.cmd [[ vnoremap <s-m-down> :m '>+1<cr>gv=gv ]]
vim.cmd [[ vnoremap <s-m-up>   :m '<-2<cr>gv=gv ]]

-- https://vim.fandom.com/wiki/Map_Ctrl-Backspace_to_delete_previous_word
SetKeyMap("<c-bs>", "<c-w>", {"n"})
SetKeyMap("<c-h>",  "<c-w>", {"n"})

-- Goto the beginning and end of a line.
SetKeyMap("<c-e>",  "<s-$>")
SetKeyMap("<c-a>",  "<s-^>")
SetKeyMap("<m-bs>", "<c-w>", {"i"})

-- https://vim.fandom.com/wiki/Shifting_blocks_visually
SetKeyMap("<Tab>",     ">>_",   {"n"})
SetKeyMap("<S-Tab>",   "<<_",   {"n"})
SetKeyMap("<S-Tab>",   "<C-D>", {"i"})
SetKeyMap("<Tab>",     ">gv",   {"v"})
SetKeyMap("<S-Tab>",   "<gv",   {"v"})

-- Tagbar
SetKeyMap("<c-c><c-a>", "<Cmd>TagbarToggle<cr>")

-- LSP
SetKeyMap("<c-c><c-d>",     vim.lsp.buf.definition)
SetKeyMap("<c-c><c-t>",     vim.lsp.buf.type_definition)
SetKeyMap("<c-c><c-i>",     vim.lsp.buf.implementation)
SetKeyMap("<c-c><c-r>",     vim.lsp.buf.references)
SetKeyMap("<c-c><c-e>",     vim.lsp.buf.rename)
SetKeyMap("<c-c><c-k>",     vim.lsp.buf.document_symbol)
SetKeyMap("<c-c><c-f>",     vim.lsp.buf.formatting_sync)
SetKeyMap("<c-_>",          ":'<,'>CommentToggle<cr>",       {"v"})
SetKeyMap("<c-_>",          "<Cmd>CommentToggle<cr>:+1<cr>", {"n"})
SetKeyMap("<c-c><c-q>",     vim.lsp.buf.signature_help,      {"i"})
SetKeyMap("<c-c><c-Right>", vim.diagnostic.goto_next)
SetKeyMap("<c-c><c-Left>",  vim.diagnostic.goto_prev)

-- Bookmark
SetKeyMap("<c-r><c-c>", "<Cmd>Telescope vim_bookmarks current_file<cr>")
SetKeyMap("<c-r><c-a>", "<Cmd>Telescope vim_bookmarks all<cr>")

-- Misc
SetKeyMap("<c-s>", "<esc>:wa<cr>")
SetKeyMap("<c-q>", "<esc>:qa<cr>")
-- https://stackoverflow.com/a/19877212/2338672
SetKeyMap("<Esc><Esc>", "<Esc><Cmd>nohlsearch<cr><Esc>", {"n"})
