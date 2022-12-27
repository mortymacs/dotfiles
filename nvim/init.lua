-- Init
require("vim")

-- Packages
vim.cmd [[ source ~/.config/nvim/lua/package.lua ]]

-- Body
require("scroll")
require("tabbar")
require("statusbar")
require("notification")

-- Splashscreen
require("splashscreen")

-- Syntax
require("theme")
require("treesitter")

-- File
require("fm")

-- Terminal
require("terminal")

-- LSP
require("lsp")

-- Git
require("git")

-- Keymap
require("keymap")

-- Orgmode
require("doc")

-- Misc
require("misc")
