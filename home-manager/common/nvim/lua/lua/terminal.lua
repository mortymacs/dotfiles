-- https://stackoverflow.com/a/63908546/2338672
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.diagnostic.disable(0)
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.foldcolumn = "0"
    vim.opt_local.signcolumn = "no"
    vim.opt_local.cursorcolumn = false
    vim.opt_local.wrap = false
    vim.opt_local.scrolloff = 0
    vim.opt_local.sidescrolloff = 0
    vim.opt_local.buflisted = false
    vim.opt_local.cursorline = false
  end,
})
