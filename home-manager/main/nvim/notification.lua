require("notify").setup({
  background_colour = "#0F0F19",
  on_open = function (win)
    vim.api.nvim_win_set_config(win, { border = "single" })
  end,
})
