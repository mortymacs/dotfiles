require("util")

-- Mouse.
SetKeyMap("<c-x><c-m>", function() ToggleCommand("set mouse=a", "set mouse=", "mouse_status") end)

-- Command.
SetKeyMap("<c-x><c-c>", "<Cmd>Commands<cr>")

-- Buffer
SetKeyMap("<c-x><c-e>", "<Cmd>BufferClose<cr>")
SetKeyMap("<c-f>",      "<Cmd>BLines<cr>")

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
SetKeyMap("<c-g><c-c>", "<Cmd>Commits<cr>")
SetKeyMap("<c-g><c-b>", "<Cmd>BCommits<cr>")
SetKeyMap("<c-g><c-t>", "<Cmd>Telescope git_stash<cr>")
SetKeyMap("<c-g><c-e>", "<esc><Cmd>GHInteractive<cr>")
SetKeyMap("<c-g><c-i>", "<esc><Cmd>Gitignore<cr>")

-- History
SetKeyMap("<c-x><c-u>", "<Cmd>Telescope undo<cr>")

-- Text
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

-- Terminal
SetKeyMap("<c-x><Up>", "<Cmd>ToggleTerm<cr>")

-- LSP
SetKeyMap("<c-c><c-d>",     vim.lsp.buf.definition)
SetKeyMap("<c-c><c-i>",     vim.lsp.buf.implementation)
SetKeyMap("<c-c><c-r>",     "<Cmd>References<cr>")
SetKeyMap("<c-c><c-e>",     function() return ":IncRename " .. vim.fn.expand("<cword>") end, { "n", "i" }, true)
SetKeyMap("<c-c><c-x>",     vim.lsp.buf.code_action)
SetKeyMap("<c-c><c-l>",     "<esc><Cmd>Format<cr>")
SetKeyMap("<c-c><c-h>",     vim.lsp.buf.hover)
SetKeyMap("<c-c><c-q>",     vim.lsp.buf.signature_help)
SetKeyMap("<c-c><c-n>",     vim.diagnostic.open_float)
SetKeyMap("<c-c><c-m>",     "<Cmd>DiagnosticsAll<cr>")
SetKeyMap("<c-c><c-s>",     "<Cmd>DocumentSymbols<cr>")
SetKeyMap("<c-c><c-f>",     "<Cmd>WorkspaceSymbols .<cr>")
SetKeyMap("<c-c><c-g>",     "<Cmd>Telescope ast_grep<cr>")
SetKeyMap("<c-c><c-w>",     "<Cmd>Telescope lsp_dynamic_workspace_symbols<cr>")
SetKeyMap("<c-c><c-j>",     function() require('treesj').toggle() end)
SetKeyMap("<c-x><c-l>",     RestartLsp)

-- Debug
SetKeyMap("<c-d><c-s>", function() require("dapui").toggle() end)
SetKeyMap("<c-d><c-t>", "<Cmd>DapToggleBreakpoint<cr>")

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
SetKeyMap("<c-l><Up>",  function ()
    DiagnosticsToQuickFix(vim.api.nvim_get_current_buf(), "Diagnostics")
    ToggleCommand("copen", "cclose", "quickfix")
end)

-- Bookmark
SetKeyMap("<c-r><c-c>", "<Cmd>Telescope vim_bookmarks current_file<cr>")
SetKeyMap("<c-r><c-a>", "<Cmd>Telescope vim_bookmarks all<cr>")

-- Package.
SetKeyMap("<c-x><c-y>", "<Cmd>Lazy! sync<cr>")

-- Misc
SetKeyMap("<c-s>", "<esc>:silent wa<cr>")
-- https://stackoverflow.com/a/19877212/2338672
SetKeyMap("<Esc><Esc>", "<Esc><Cmd>nohlsearch<cr><Esc>", { "n" })
