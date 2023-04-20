require("toggleterm").setup()
-- https://stackoverflow.com/a/63908546/2338672
vim.api.nvim_create_autocmd("TermOpen", {command = "setlocal nonu nornu signcolumn=no"})
