-- Config.
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = false,
  update_in_insert = true,
  severity_sort = true,
  virtual_lines = {
    only_current_line = false,
    highighlight_whole_line = false,
  },
})
-- Configure diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = signs.Error,
      [vim.diagnostic.severity.WARN] = signs.Warn,
      [vim.diagnostic.severity.HINT] = signs.Hint,
      [vim.diagnostic.severity.INFO] = signs.Info,
    },
  },
})

-- UI.
local border = {
  { "┌", "FloatBorder" },
  { "─", "FloatBorder" },
  { "┐", "FloatBorder" },
  { "│", "FloatBorder" },
  { "┘", "FloatBorder" },
  { "─", "FloatBorder" },
  { "└", "FloatBorder" },
  { "│", "FloatBorder" },
}
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Tiny Inline.
require("tiny-inline-diagnostic").setup({
  virt_texts = {
    priority = 70,
  },
})
