-- Init.
require("vim")

-- Packages.
vim.cmd [[ source ~/.config/nvim/lua/package.lua ]]

-- Syntax.
require("theme")

-- Body.
require("tabbar")
require("statusline")
require("notification")
require("cmd")

-- Splash screen.
require("splashscreen")

-- Tree / Finder.
require("tree")
require("finder")

-- Terminal.
require("terminal")

-- Git.
require("git")

-- Development.
require("development")

-- LSP / Debug
require("lsp")
require("diagnostic")

-- Debug
vim.cmd [[ source ~/.config/nvim/lua/debug.lua ]]

-- Keybinding.
require("keymap")