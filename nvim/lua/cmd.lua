require("noice").setup({
  lsp = {
    signature = {
      enabled = false,
    },
    hover = {
      enabled = false,
    },
  },
  messages = {
    enabled = false,
  },
  popupmenu = {
    enabled = false,
  },
  cmdline = {
    format = {
      cmdline = { icon = ">" },
      lua = { icon = ">" },
    },
  },
  smart_move = {
    enabled = false,
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = false,
  },
  views = {
    cmdline_popup = {
      size = {
        width = 100,
        height = "auto",
      },
      border = {
        style = "single",
        padding = { 0, 0, },
      },
    },
  },
})
