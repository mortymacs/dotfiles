-- Body
vim.opt.nu = true

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
vim.opt.updatetime = 300

-- Indentation
vim.opt.cindent = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.backspace = "2"

-- Menu
vim.opt.completeopt = "menu,menuone,noselect"

-- Wrap
vim.opt.wrap = false
-- https://superuser.com/a/559436
vim.opt.whichwrap:append("<,>,h,l,[,]")

-- Mouse
vim.opt.mouse = ""

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Misc
vim.opt.hidden = true
vim.opt.signcolumn = "yes"