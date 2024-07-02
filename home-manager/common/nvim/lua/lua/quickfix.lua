--require("util")

-- BQF.
require("bqf").setup({
  auto_enable = true,
  auto_resize_height = true,
  preview = {
    border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
  },
  func_map = {
    pscrolldown = "<c-j>",
    pscrollup = "<c-k>",
  },
})

--- QFView.
require("qfview").setup()

-- Trouble.
require("trouble").setup()

-- Update quickfix diagnostic items.
--vim.api.nvim_create_autocmd({ "DiagnosticChanged" }, {
--  pattern = "<buffer>",
--  callback = function()
--    DiagnosticsToQuickFix(vim.api.nvim_get_current_buf(), "Diagnostics")
--  end,
--})
