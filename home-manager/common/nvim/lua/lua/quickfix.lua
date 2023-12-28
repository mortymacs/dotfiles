-- Trouble.
require("trouble").setup({
  padding = false,
  fold_open = "",
  fold_closed = "",
  signs = {
    error = "",
    warning = "",
    hint = "󰵚",
    information = "󰸥",
    other = "󰟃",
  },
  use_diagnostic_signs = true,
})

-- BQF.
require("bqf").setup({
  auto_enable = true,
  auto_resize_height = true,
})

-- QFView.
require("qfview").setup()
