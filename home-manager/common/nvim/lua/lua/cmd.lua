-- Setup.
require("noice").setup({
  lsp = {
    signature = {
      enabled = false,
    },
    hover = {
      enabled = false,
    },
    progress = {
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
      cmdline = {
        icon = ">",
      },
      lua = {
        icon = ">",
      },
      help = {
        icon = "?",
      },
      search_down = {
        icon = " ",
      },
      search_up = {
        icon = " ",
      },
    },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = true,
    lsp_doc_border = false,
  },
  views = {
    cmdline_popup = {
      border = {
        style = "single",
        padding = { 0, 0 },
      },
    },
  },
})
