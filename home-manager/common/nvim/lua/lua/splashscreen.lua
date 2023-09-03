require("util")

-- Default config: print(vim.inspect(require("alpha.themes.dashboard").opts))
local config = {
  layout = {
    {
      type = "padding",
      val = CalcTopPadding(8),
    },
    {
      opts = {
        hl = "AlphaHeader",
        position = "center",
      },
      type = "text",
      val = {
        "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
        "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
        "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
        "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
        "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
        "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
      },
    },
    {
      type = "padding",
      val = 1,
    },
    {
      opts = {
        spacing = 1,
      },
      type = "group",
      val = {
        {
          on_press = function()
            vim.cmd([[ene]])
          end,
          opts = {
            hl = "AlphaButton",
            align_shortcut = "right",
            cursor = 3,
            hl_shortcut = "Keyword",
            position = "center",
            shortcut = "n",
            keymap = { "n", "n", "<Cmd>ene<cr>", { noremap = true, nowait = true, silent = true } },
            width = 50,
          },
          type = "button",
          val = " New file",
        },
        {
          on_press = function()
            vim.cmd([[Files]])
          end,
          opts = {
            hl = "AlphaButton",
            align_shortcut = "right",
            cursor = 3,
            hl_shortcut = "Keyword",
            position = "center",
            shortcut = "f",
            keymap = { "n", "f", "<Cmd>Files<cr>", { noremap = true, nowait = true, silent = true } },
            width = 50,
          },
          type = "button",
          val = "󰈞 Find file",
        },
        {
          on_press = function()
            vim.cmd([[Telescope ghq]])
          end,
          opts = {
            hl = "AlphaButton",
            align_shortcut = "right",
            cursor = 3,
            hl_shortcut = "Keyword",
            position = "center",
            shortcut = "p",
            keymap = { "n", "p", "<Cmd>Telescope ghq<cr>", { noremap = true, nowait = true, silent = true } },
            width = 50,
          },
          type = "button",
          val = " Find projects",
        },
        {
          on_press = function()
            vim.cmd([[Telescope ast_grep]])
          end,
          opts = {
            hl = "AlphaButton",
            align_shortcut = "right",
            cursor = 3,
            hl_shortcut = "Keyword",
            position = "center",
            shortcut = "t",
            keymap = { "n", "t", "<Cmd>Telescope ast_grep<cr>", { noremap = true, nowait = true, silent = true } },
            width = 50,
          },
          type = "button",
          val = " Find tags",
        },
        {
          on_press = function()
            vim.cmd([[Telescope live_grep]])
          end,
          opts = {
            hl = "AlphaButton",
            align_shortcut = "right",
            cursor = 3,
            hl_shortcut = "Keyword",
            position = "center",
            shortcut = "g",
            keymap = { "n", "g", "<Cmd>Telescope live_grep<cr>", { noremap = true, nowait = true, silent = true } },
            width = 50,
          },
          type = "button",
          val = "󰈬 Find word",
        },
        {
          on_press = function()
            vim.cmd([[Telescope vim_bookmarks all]])
          end,
          opts = {
            hl = "AlphaButton",
            align_shortcut = "right",
            cursor = 3,
            hl_shortcut = "Keyword",
            position = "center",
            shortcut = "b",
            keymap = {
              "n",
              "b",
              "<Cmd>Telescope vim_bookmarks all<cr>",
              { noremap = true, nowait = true, silent = true },
            },
            width = 50,
          },
          type = "button",
          val = " Bookmarks",
        },
        {
          on_press = function()
            vim.cmd([[q]])
          end,
          opts = {
            hl = "AlphaButton",
            align_shortcut = "right",
            cursor = 3,
            hl_shortcut = "Keyword",
            position = "center",
            shortcut = "q",
            keymap = { "n", "q", ":q<cr>", { noremap = true, nowait = true, silent = true } },
            width = 50,
          },
          type = "button",
          val = " Exit",
        },
      },
    },
  },
  opts = {
    autostart = true,
    keymap = {
      press = "<CR>",
      queue_press = "<M-CR>",
    },
    margin = 5,
  },
}

require("alpha").setup(config)
