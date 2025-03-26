-- Restore cursor to the default one.
vim.api.nvim_create_autocmd({ "VimLeave" }, {
  callback = function()
    vim.opt.guicursor = { "a:block" }
  end,
})
