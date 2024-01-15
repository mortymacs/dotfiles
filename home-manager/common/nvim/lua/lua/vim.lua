-- Performance
vim.loader.enable()

-- Body
vim.opt.nu = true
vim.opt.relativenumber = false
vim.opt.fillchars = "eob: "

-- File, syntax and theme
vim.opt.filetype = "on"
vim.opt.compatible = false
vim.opt.syntax = "on"
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Backup
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.updatetime = 300

-- Indentation
vim.opt.cindent = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.backspace = "2"
vim.opt.list = false

-- Menu
vim.opt.completeopt = "menu,menuone,noselect"

-- Statusline
vim.opt.statusline = ""
vim.opt.cmdheight = 1
vim.opt.laststatus = 2

-- Line number
vim.opt.numberwidth = 5

-- Wrap
vim.opt.wrap = false
-- https://superuser.com/a/559436
vim.opt.whichwrap:append("<,>,h,l,[,]")

-- Mouse
vim.opt.mouse = ""

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Timeout
vim.opt.timeout = true
vim.opt.timeoutlen = 300

-- Misc
vim.opt.hidden = true
vim.opt.signcolumn = "auto:2"
vim.opt.colorcolumn = "120"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
