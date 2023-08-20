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
require("bqf").setup()

-- QFView.
require("qfview").setup()
