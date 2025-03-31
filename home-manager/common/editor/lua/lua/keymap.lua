require("util")
local snacks = require("snacks")
local telescope = require("telescope.builtin")
local flash = require("flash")

-- Mouse.
SetKeyMap("<c-x><c-m>", function() ToggleCommand("set mouse=a", "set mouse=", "mouse_status") end, nil, nil, "ToggleMouse")

-- Command.
SetKeyMap("<c-x><c-c>", snacks.picker.commands, nil, nil, "Commands")
SetKeyMap("<c-x><c-k>", snacks.picker.keymaps,  nil, nil, "Keymaps")

-- Buffer
SetKeyMap("<c-x><c-q>", function () snacks.bufdelete() end, nil, nil, "DeleteBuffer")
SetKeyMap("<c-f>",      snacks.picker.lines,                nil, nil, "FuzzyFinder")
SetKeyMap("<m-f>",    "<Cmd>Namu symbols<cr>",            nil, nil, "Symbols")

-- Tabbar.
SetKeyMap("<s-h>",      "<Cmd>BufferPrevious<cr>", { "n" })
SetKeyMap("<s-l>",      "<Cmd>BufferNext<cr>",     { "n" })
SetKeyMap("<c-x><c-n>", "<Cmd>tabnew<cr>")

-- File and directory
SetKeyMap("<c-x><c-f>", snacks.picker.files, nil, nil, "FindFiles")
SetKeyMap("<c-x><c-d>", "<Cmd>BufferCloseAllButCurrent<cr>")
SetKeyMap("<c-]>",      "<Cmd>Neotree toggle<cr>")
SetKeyMap("<c-x><c-r>", "<Cmd>Neotree reveal<cr>")

-- Search
SetKeyMap("<c-x><c-s-g>", function ()
  local word_under_cursor = vim.fn.expand('<cword>')
  if word_under_cursor and word_under_cursor ~= "" then
    snacks.picker.grep_word()
  else
    snacks.picker.grep()
  end
end, nil, nil, "LiveGrep")
SetKeyMap("<c-x><c-g>", snacks.picker.grep, nil, nil, "LiveGrep")

-- Finder.
SetKeyMap("sf", function()
    flash.jump({
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
end, { "n", "x", "o" })
SetKeyMap("ss", function()
    flash.jump({
        pattern = vim.fn.expand("<cword>"),
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
end, { "n", "x", "o" }, nil, "FlasJumpCursor")
SetKeyMap("sv", function()
    flash.treesitter_search({
        pattern = vim.fn.expand("<cword>"),
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
end, { "n", "x", "o" }, nil, "FlashTreeSitterSearchCursor")
SetKeyMap("sc", function()
    flash.treesitter_search({
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
end, { "n", "x", "o" }, nil, "FlashTreeSitterSearch")
SetKeyMap("<esc>", "<Cmd>noh<cr>", { "n" })

-- Git
SetKeyMap("<c-g><c-p>", "<Cmd>Gitsigns preview_hunk<cr>")
SetKeyMap("<c-g><c-r>", "<Cmd>Gitsigns reset_hunk<cr>")
SetKeyMap("<c-g><c-a>", "<Cmd>Gitsigns stage_hunk<cr>")
SetKeyMap("<c-g><c-u>", "<Cmd>Gitsigns undo_stage_hunk<cr>")
SetKeyMap("<c-g><c-s>", snacks.picker.git_status, nil, nil, "GitStatus")
SetKeyMap("<c-g><c-d>", function() ToggleCommand("DiffviewOpen", "DiffviewClose", "diff_view_status") end, nil, nil, "ToggleDiffView")
SetKeyMap("<c-g><c-h>", function() ToggleCommand("DiffviewFileHistory", "DiffviewClose", "diff_view_status") end, nil, nil, "ToggleDiffViewFileHistory")
SetKeyMap("<c-g><c-c>", snacks.picker.git_log, nil, nil, "GitCommits")
SetKeyMap("<c-g><c-l>", snacks.git.blame_line, nil, nil, "GitCommits")
SetKeyMap("<c-g><c-b>", snacks.picker.git_log_file, nil, nil, "GitBCommits")
SetKeyMap("<c-g><c-t>", telescope.git_stash, nil, nil, "GitStash")
SetKeyMap("<c-g><c-e>", function () snacks.gitbrowse() end, nil, nil, "GitBrowse")
SetKeyMap("<c-g><c-i>", "<esc><Cmd>Gitignore<cr>")

-- History
SetKeyMap("<c-x><c-h>", snacks.picker.help)

-- Text
-- Stop copying text on delete.
SetKeyMap("<Del>", '"_d',  { "v" })
SetKeyMap("d",     '"_d',  { "v" })
-- Decorated yank.
SetKeyMap("<c-y>", function() require('decorated_yank').decorated_yank_with_link() end,  { "v" }, nil, "DecoratedYank")
-- Transformation.
SetKeyMap("<c-t>0", function() require("textcase").operator("to_lower_case") end,        { "v" },      nil, "ToLowerCase")
SetKeyMap("<c-t>0", function() require("textcase").current_word("to_lower_case") end,    { "n", "i" }, nil, "ToLowerCase")
SetKeyMap("<c-t>1", function() require("textcase").operator("to_upper_case") end,        { "v" },      nil, "ToUpperCase")
SetKeyMap("<c-t>1", function() require("textcase").current_word("to_upper_case") end,    { "n", "i" }, nil, "ToUpperCase")
SetKeyMap("<c-t>2", function() require("textcase").operator("to_snake_case") end,        { "v" },      nil, "ToSnakeCase")
SetKeyMap("<c-t>2", function() require("textcase").current_word("to_snake_case") end,    { "n", "i" }, nil, "ToSnakeCase")
SetKeyMap("<c-t>3", function() require("textcase").operator("to_dash_case") end,         { "v" },      nil, "ToDashCase")
SetKeyMap("<c-t>3", function() require("textcase").current_word("to_dash_case") end,     { "n", "i" }, nil, "ToDashCase")
SetKeyMap("<c-t>4", function() require("textcase").operator("to_constant_case") end,     { "v" },      nil, "ToConstantCase")
SetKeyMap("<c-t>4", function() require("textcase").current_word("to_constant_case") end, { "n", "i" }, nil, "ToConstantCase")
SetKeyMap("<c-t>5", function() require("textcase").operator("to_dot_case") end,          { "v" },      nil, "ToDotCase")
SetKeyMap("<c-t>5", function() require("textcase").current_word("to_dot_case") end,      { "n", "i" }, nil, "ToDotCase")
SetKeyMap("<c-t>6", function() require("textcase").operator("to_phrase_case") end,       { "v" },      nil, "ToPhraseCase")
SetKeyMap("<c-t>6", function() require("textcase").current_word("to_phrase_case") end,   { "n", "i" }, nil, "ToPhraseCase")
SetKeyMap("<c-t>7", function() require("textcase").operator("to_camel_case") end,        { "v" },      nil, "ToCamelCase")
SetKeyMap("<c-t>7", function() require("textcase").current_word("to_camel_case") end,    { "n", "i" }, nil, "ToCamelCase")
SetKeyMap("<c-t>8", function() require("textcase").operator("to_pascal_case") end,       { "v" },      nil, "ToPascalCase")
SetKeyMap("<c-t>8", function() require("textcase").current_word("to_pascal_case") end,   { "n", "i" }, nil, "ToPascalCase")
SetKeyMap("<c-t>9", function() require("textcase").operator("to_title_case") end,        { "v" },      nil, "ToTitleCase")
SetKeyMap("<c-t>9", function() require("textcase").current_word("to_title_case") end,    { "n", "i" }, nil, "ToTitleCase")
-- Delete word.
SetKeyMap("<c-s-w>", "<C-o>dw",  { "i" })
SetKeyMap("<c-b>",   "<C-o>ciw", { "i" })

-- Terminal
SetKeyMap("<c-b>t", function () snacks.terminal() end, nil, nil, "ToggleTerminal")
SetKeyMap("<c-e>",  function () snacks.terminal() end, nil, nil, "ToggleTerminal")

-- LSP
SetKeyMap("<c-c><c-d>", snacks.picker.lsp_definitions, nil, nil, "LspDefinition")
SetKeyMap("<c-c><c-i>", snacks.picker.lsp_implementations, nil, nil, "LspImplementation")
SetKeyMap("<c-c><c-r>", snacks.picker.lsp_references, nil, nil, "LspReferences")
SetKeyMap("<c-c><c-e>", vim.lsp.buf.rename, nil, nil, "LspRename")
SetKeyMap("<c-c><c-x>", vim.lsp.buf.code_action, nil, nil, "LspCodeAction")
SetKeyMap("<c-c><c-l>", "<esc><Cmd>Format<cr>")
SetKeyMap("<c-c><c-h>", vim.lsp.buf.signature_help, nil, nil, "LspSignatureHelp")
SetKeyMap("<c-c><c-n>", vim.diagnostic.open_float)
SetKeyMap("<c-c><c-m>", snacks.picker.diagnostics, nil, nil, "Diagnostics")
SetKeyMap("<c-c><c-s>", snacks.picker.lsp_symbols, nil, nil, "LspDocumentSymbols")
SetKeyMap("<c-c><c-f>", telescope.lsp_workspace_symbols, nil, nil, "LspWorkspaceSymbols")
SetKeyMap("<c-c><c-g>", "<Cmd>Telescope ast_grep<cr>")
SetKeyMap("<c-c><c-w>", telescope.lsp_dynamic_workspace_symbols, nil, nil, "LspDynamicWorkspaceSymbols")
SetKeyMap("<c-c><c-a>", "<Cmd>Outline<cr>")
SetKeyMap("<c-c><c-j>", function() require('treesj').toggle() end, nil, nil, "TreeSitterSplitJoinToggle")
SetKeyMap("<c-x><c-l>", RestartLsp, nil, nil, "RestartLsp")

-- Debug
SetKeyMap("<c-d><c-s>", function() require("dapui").toggle() end, nil, nil, "DapToggle")
SetKeyMap("<c-d><c-t>", "<Cmd>DapToggleBreakpoint<cr>")

-- Test
SetKeyMap("<c-t><c-x>",     "<esc><Cmd>Neotest run<cr>")
SetKeyMap("<c-t><c-f>",     "<esc><Cmd>Neotest run file<cr>")
SetKeyMap("<c-t><c-r>",     "<esc><Cmd>Neotest output<cr>")
SetKeyMap("<c-t><up>",      "<esc><Cmd>Neotest output-panel<cr>")
SetKeyMap("<c-t><c-s>",     "<esc><Cmd>Neotest summary<cr>")
SetKeyMap("<c-t><c-right>", "<esc><Cmd>Neotest jump next<cr>")
SetKeyMap("<c-t><c-left>",  "<esc><Cmd>Neotest jump prev<cr>")

-- Trouble / Quickfix.
SetKeyMap("<c-x><c-i>", "<Cmd>TroubleToggle todo<cr>")

-- AI.
SetKeyMap("<c-a>c", "<Cmd>ChatGPTRun complete_code<cr>",      { "n", "v" })
SetKeyMap("<c-a>f", "<Cmd>ChatGPTRun fix_bugs<cr>",           { "n", "v" })
SetKeyMap("<c-a>g", "<Cmd>ChatGPTRun grammar_correction<cr>", { "n", "v" })
SetKeyMap("<c-a>d", "<Cmd>ChatGPTRun docstring<cr>",          { "n", "v" })
SetKeyMap("<c-a>e", "<Cmd>ChatGPTRun explain_code<cr>",       { "v" })
SetKeyMap("<c-a>a", "<Cmd>AvanteAsk<cr>",                     { "n" })
SetKeyMap("<c-a>t", ":CodyTask ",                             { "n", "v" })

-- Package.
SetKeyMap("<c-x><c-y>", "<Cmd>Lazy! sync<cr>")

-- Misc.
SetKeyMap("<c-s>", "<esc>:silent wa<cr>")
