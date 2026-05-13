-- BQF.
require("bqf").setup({
  auto_enable = true,
  auto_resize_height = true,
  preview = {
    border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
  },
  func_map = {
    pscrolldown = "<c-down>",
    pscrollup = "<c-up>",
  },
})

-- Trouble.
require("trouble").setup()
