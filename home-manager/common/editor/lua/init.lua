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

-- Git.
require("git")

-- Development / Quickfix.
require("development")
require("quickfix")
require("text")

-- LSP / Debug
require("lsp")
require("diagnostic")

-- Keybinding.
require("keymap")

-- Misc.
require("misc")
