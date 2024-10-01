-- General
require("trim").setup()

-- Move lines
require("mini.move").setup({
  mappings = {
    left = "",
    right = "",
    down = "<s-m-down>",
    up = "<s-m-up>",
    line_left = "",
    line_right = "",
    line_down = "<s-m-down>",
    line_up = "<s-m-up>",
  },
})

-- Indentation
require("mini.indentscope").setup({
  draw = {
    animation = require("mini.indentscope").gen_animation.none(),
  },
  symbol = "│",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "alpha",
    "NvimTree",
  },
  command = ":lua vim.b.miniindentscope_disable=true",
})

-- TreeSJ.
require("treesj").setup()

-- Fold.
local handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = (" ... 󰁂 %d "):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, "MoreMsg" })
  return newVirtText
end

require("ufo").setup({
  preview = {
    win_config = {
      border = "single",
      winhighlight = "Normal:FloatBorder",
      winblend = 0,
    },
    mappings = {
      scrollU = "<C-Up>",
      scrollD = "<C-Down>",
      jumpTop = "[",
      jumpBot = "]",
    },
  },
  provider_selector = function(bufnr, filetype, buftype)
    return { "treesitter", "indent" }
  end,
  fold_virt_text_handler = handler,
})
