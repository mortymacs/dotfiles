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

-- AI.
require("ai")

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

-- Misc.
require("misc")

-- Event.
require("event")
