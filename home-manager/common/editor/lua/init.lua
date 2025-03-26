-- Init.
require("vim")

-- Packages.
vim.cmd [[ source ~/.config/nvim/lua/package.lua ]]

-- Syntax.
require("theme")

-- Body.
require("tabbar")
require("statusline")

-- Tree / Finder.
require("tree")
require("finder")

-- Terminal.
require("terminal")

-- Git.
require("git")

-- Development / Quickfix.
require("development")
require("quickfix")
require("text")

-- LSP / Debug
require("lsp")
require("diagnostic")

-- Test
require("test")

-- Debug
vim.cmd [[ source ~/.config/nvim/lua/debug.lua ]]

-- Keybinding.
require("keymap")

-- AI.
require("ai")

-- Misc.
require("misc")

-- Event.
require("event")
