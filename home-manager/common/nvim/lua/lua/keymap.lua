require("util")

-- Mouse.
SetKeyMap("<c-x><c-m>", function() ToggleCommand("set mouse=a", "set mouse=", "mouse_status") end)

-- Command.
SetKeyMap("<c-x><c-c>", "<Cmd>Telescope command_palette<cr>")

-- Split and close panes
SetKeyMap("<c-x><c-v>", "<Cmd>vsplit<cr>")
SetKeyMap("<c-x><c-h>", "<Cmd>split<cr>")

-- Moving around panes
SetKeyMap("<m-up>",    "<esc><c-w><c-k>")
SetKeyMap("<m-down>",  "<esc><c-w><c-j>")
SetKeyMap("<m-left>",  "<esc><c-w><c-h>")
SetKeyMap("<m-right>", "<esc><c-w><c-l>")

-- Resize panes
SetKeyMap("<c-s-up>",    "<Cmd>resize -1<cr>")
SetKeyMap("<c-s-down>",  "<Cmd>resize +1<cr>")
SetKeyMap("<c-s-left>",  "<Cmd>vertical resize +1<cr>")
SetKeyMap("<c-s-right>", "<Cmd>vertical resize -1<cr>")

-- Buffer
SetKeyMap("<c-x><c-e>", "<Cmd>BufferClose<cr>")
SetKeyMap("<c-f>",      "<Cmd>Telescope current_buffer_fuzzy_find<cr>")
SetKeyMap("<c-x><c-r>", "<Cmd>MurenToggle<cr>")

-- Tabbar.
SetKeyMap("<s-left>",   "<Cmd>BufferPrevious<cr>")
SetKeyMap("<s-right>",  "<Cmd>BufferNext<cr>")
SetKeyMap("<c-x><c-q>", ":qa<cr>")
SetKeyMap("<c-x><c-n>", "<Cmd>tabnew<cr>")

-- File and directory
SetKeyMap("<c-x><c-f>", "<esc><Cmd>Files<cr>")
SetKeyMap("<c-x><c-p>", "<Cmd>Telescope ghq<cr>")
SetKeyMap("<c-x><c-d>", "<Cmd>Telescope file_browser<cr>")
SetKeyMap("<c-x><c-b>", "<esc><Cmd>Buffers<cr>")
SetKeyMap("<c-x><c-t>", "<Cmd>Telescope filetypes<cr>")
SetKeyMap("<c-]>",      "<Cmd>NeoTreeShowToggle<cr>")

-- Search
SetKeyMap("<c-x><c-g>", "<Cmd>Telescope live_grep<cr>")

-- Git
SetKeyMap("<c-g><c-p>", "<Cmd>Gitsigns preview_hunk<cr>")
SetKeyMap("<c-g><c-r>", "<Cmd>Gitsigns reset_hunk<cr>")
SetKeyMap("<c-g><c-a>", "<Cmd>Gitsigns stage_hunk<cr>")
SetKeyMap("<c-g><c-u>", "<Cmd>Gitsigns undo_stage_hunk<cr>")
SetKeyMap("<c-g><c-s>", "<Cmd>Telescope git_status<cr>")
SetKeyMap("<c-g><c-d>", function() ToggleCommand("DiffviewOpen", "DiffviewClose", "diff_view_status") end)
SetKeyMap("<c-g><c-b>", "<Cmd>Telescope git_branches<cr>")
SetKeyMap("<c-g><c-h>", function() ToggleCommand("DiffviewFileHistory", "DiffviewClose", "diff_view_status") end)
SetKeyMap("<c-g><c-c>", "<Cmd>Telescope git_commits<cr>")
SetKeyMap("<c-g><c-t>", "<Cmd>Telescope git_stash<cr>")
SetKeyMap("<c-g><c-e>", "<esc><Cmd>GHInteractive<cr>")
SetKeyMap("<c-g><c-i>", "<esc><Cmd>Gitignore<cr>")

-- History
SetKeyMap("<c-x><c-u>", "<Cmd>Telescope undo<cr>")
SetKeyMap("u",          "<esc><Cmd>silent undo<cr>", {"n"})
SetKeyMap("U",          "<esc><Cmd>silent redo<cr>", {"n"})

-- Text
-- other options: v$ v0o$
SetKeyMap("<c-space>", "<esc>v", { "n" })
SetKeyMap("<c-@>",     "<esc>v")
SetKeyMap("<c-d>",     "<esc>yyp")
SetKeyMap("<c-z>",     "<esc>u")
-- Stop copying text on delete.
SetKeyMap("<Del>",     '"_d',    { "v" })
-- Decorated yank.
SetKeyMap("<c-y>", function() require('decorated_yank').decorated_yank_with_link() end,  { "v" })
-- Transformation.
SetKeyMap("<c-t>0", function() require("textcase").operator("to_lower_case") end,        { "v" })
SetKeyMap("<c-t>0", function() require("textcase").current_word("to_lower_case") end,    { "n", "i" })
SetKeyMap("<c-t>1", function() require("textcase").operator("to_upper_case") end,        { "v" })
SetKeyMap("<c-t>1", function() require("textcase").current_word("to_upper_case") end,    { "n", "i" })
SetKeyMap("<c-t>2", function() require("textcase").operator("to_snake_case") end,        { "v" })
SetKeyMap("<c-t>2", function() require("textcase").current_word("to_snake_case") end,    { "n", "i" })
SetKeyMap("<c-t>3", function() require("textcase").operator("to_dash_case") end,         { "v" })
SetKeyMap("<c-t>3", function() require("textcase").current_word("to_dash_case") end,     { "n", "i" })
SetKeyMap("<c-t>4", function() require("textcase").operator("to_constant_case") end,     { "v" })
SetKeyMap("<c-t>4", function() require("textcase").current_word("to_constant_case") end, { "n", "i" })
SetKeyMap("<c-t>5", function() require("textcase").operator("to_dot_case") end,          { "v" })
SetKeyMap("<c-t>5", function() require("textcase").current_word("to_dot_case") end,      { "n", "i" })
SetKeyMap("<c-t>6", function() require("textcase").operator("to_phrase_case") end,       { "v" })
SetKeyMap("<c-t>6", function() require("textcase").current_word("to_phrase_case") end,   { "n", "i" })
SetKeyMap("<c-t>7", function() require("textcase").operator("to_camel_case") end,        { "v" })
SetKeyMap("<c-t>7", function() require("textcase").current_word("to_camel_case") end,    { "n", "i" })
SetKeyMap("<c-t>8", function() require("textcase").operator("to_pascal_case") end,       { "v" })
SetKeyMap("<c-t>8", function() require("textcase").current_word("to_pascal_case") end,   { "n", "i" })
SetKeyMap("<c-t>9", function() require("textcase").operator("to_title_case") end,        { "v" })
SetKeyMap("<c-t>9", function() require("textcase").current_word("to_title_case") end,    { "n", "i" })

-- Search
SetKeyMap("<c-x><c-s>", function()
    require("flash").jump({
        continue = false,
        search = {
            mode = "fuzzy",
        },
        label = {
            rainbow = {
                enabled = true,
            },
        },
    })
end)

-- https://stackoverflow.com/a/63887462/2338672
SetKeyMap("<s-m-down>", "<esc><Cmd>m .+1<cr>==gi", { "i" })
SetKeyMap("<s-m-up>",   "<esc><Cmd>m .-2<cr>==gi", { "i" })

-- https://vim.fandom.com/wiki/Map_Ctrl-Backspace_to_delete_previous_word
SetKeyMap("<c-bs>", "<c-w>", { "n" })
SetKeyMap("<c-h>",  "<c-w>", { "n" })

-- Goto the beginning and end of a line.
SetKeyMap("<c-e>",  "<s-$>")
SetKeyMap("<c-a>",  "<s-^>")
SetKeyMap("<m-bs>", "<c-w>", { "i" })

-- https://vim.fandom.com/wiki/Shifting_blocks_visually
SetKeyMap("<Tab>",     ">>_",   { "n" })
SetKeyMap("<S-Tab>",   "<<_",   { "n" })
SetKeyMap("<S-Tab>",   "<C-D>", { "i" })
SetKeyMap("<Tab>",     ">gv",   { "v" })
SetKeyMap("<S-Tab>",   "<gv",   { "v" })

-- Tagbar
SetKeyMap("<c-c><c-a>", "<Cmd>SymbolsOutline<cr>")

-- Terminal
SetKeyMap("<c-x><Up>", "<Cmd>ToggleTerm<cr>")
SetKeyMap("<c-up>",    "<c-\\><c-n>", {"t"})

-- LSP
SetKeyMap("<c-c><c-d>",     vim.lsp.buf.definition)
SetKeyMap("<c-c><c-t>",     "<Cmd>Lspsaga peek_definition<cr>")
SetKeyMap("<c-c><c-i>",     "<Cmd>Implementations<cr>")
SetKeyMap("<c-c><c-r>",     "<Cmd>References<cr>")
SetKeyMap("<c-c><c-e>",     function() return ":IncRename " .. vim.fn.expand("<cword>") end, { "n", "i" }, true)
SetKeyMap("<c-c><c-x>",     "<Cmd>Lspsaga code_action<cr>")
SetKeyMap("<c-c><c-v>",     "<Cmd>Lspsaga finder<cr>")
SetKeyMap("<c-c><c-l>",     "<esc><Cmd>Format<cr>")
SetKeyMap("<c-_>",          ":'<,'>CommentToggle<cr>",                                       { "v" })
SetKeyMap("<c-_>",          "<Cmd>CommentToggle<cr>:+1<cr>",                                 { "n" })
SetKeyMap("<c-_>",          "<esc><Cmd>CommentToggle<cr>:+1<cr>",                            { "i" })
SetKeyMap("<c-c><c-q>",     "<Cmd>Lspsaga hover_doc<cr>")
SetKeyMap("<c-c><c-n>",     "<Cmd>Lspsaga show_line_diagnostics<cr>")
SetKeyMap("<c-c><c-Right>", "<Cmd>Lspsaga diagnostic_jump_next<cr>")
SetKeyMap("<c-c><c-Left>",  "<Cmd>Lspsaga diagnostic_jump_prev<cr>")
SetKeyMap("<c-c><c-s>",     "<Cmd>DocumentSymbols<cr>")
SetKeyMap("<c-c><c-f>",     "<Cmd>WorkspaceSymbols .<cr>")
SetKeyMap("<c-c><c-g>",     "<Cmd>Telescope ast_grep<cr>")
SetKeyMap("<c-c><c-w>",     "<Cmd>Telescope lsp_dynamic_workspace_symbols<cr>")
SetKeyMap("<c-c><c-p>",     "<Cmd>Lspsaga peek_definition<cr>")
SetKeyMap("<c-c><c-j>",     function() require('treesj').toggle() end)
SetKeyMap("<c-x><c-l>",     RestartLsp)

-- Debug
SetKeyMap("<c-j><c-s>", function() require("dapui").toggle() end)
SetKeyMap("<c-j><c-t>", "<Cmd>DapToggleBreakpoint<cr>")

-- Test
SetKeyMap("<c-t><c-x>",     "<esc><Cmd>Neotest run<cr>")
SetKeyMap("<c-t><c-f>",     "<esc><Cmd>Neotest run file<cr>")
SetKeyMap("<c-t><c-r>",     "<esc><Cmd>Neotest output<cr>")
SetKeyMap("<c-t><Up>",      "<esc><Cmd>Neotest output-panel<cr>")
SetKeyMap("<c-t><c-s>",     "<esc><Cmd>Neotest summary<cr>")
SetKeyMap("<c-t><c-Right>", "<esc><Cmd>Neotest jump next<cr>")
SetKeyMap("<c-t><c-Left>",  "<esc><Cmd>Neotest jump prev<cr>")

-- Trouble / Quickfix.
SetKeyMap("<c-l><c-e>", "<Cmd>Telescope diagnostics<cr>")
SetKeyMap("<c-l><Up>",  "<Cmd>TroubleToggle workspace_diagnostics<cr>")
SetKeyMap("<c-l><c-q>", "<Cmd>TroubleToggle quickfix<cr>")

-- Bookmark
SetKeyMap("<c-r><c-c>", "<Cmd>Telescope vim_bookmarks current_file<cr>")
SetKeyMap("<c-r><c-a>", "<Cmd>Telescope vim_bookmarks all<cr>")

-- Package.
SetKeyMap("<c-x><c-y>", "<Cmd>Lazy! sync<cr>")

-- Misc
SetKeyMap("<c-s>", "<esc>:silent wa<cr>")
-- https://stackoverflow.com/a/19877212/2338672
SetKeyMap("<Esc><Esc>", "<Esc><Cmd>nohlsearch<cr><Esc>", { "n" })
