-- Large files.
require("bigfile").setup({
  filesize = 2,
  pattern = { "*" },
  features = {
    "indent_blankline",
    "illuminate",
    "lsp",
    "treesitter",
    "matchparen",
    "vimopts",
  },
})

-- Snacks.
require("snacks").setup({
  lazygit = { enabled = false },
  bigfile = { enabled = true },
  dashboard = {
    enabled = true,
    width = 68,
    pane_gap = 4,
    preset = {
      keys = {
        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
        { icon = " ", key = "p", desc = "Find Projects", action = ":Telescope ghq" },
        { icon = " ", key = "f", desc = "Find File", action = ":Files" },
        { icon = " ", key = "g", desc = "Find Text", action = ":Rg" },
        { icon = "󰈬 ", key = "t", desc = "Find Tag", action = ":Telescope live_grep" },
        { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
        { icon = " ", key = "b", desc = "Bookmarks", action = ":Telescope vim_bookmarks all" },
        { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
      },
      header = [[
 _____  ___    _______    ______  ___      ___  __     ___      ___
|\"   \|"  \  /"     "|  /    " \|"  \    /"  ||" \   |"  \    /"  |
|.\\   \    ||: ______| // ____  \\   \  //  / ||  |   \   \  //   |
|: \.   \\  | \/    |  /  /    / :|\\  \/. ./  |:  |   /\\  \/.    |
|.  \    \. | // ___|_|: /____/ //  \.    //   |.  |  |: \.        |
|    \    \ ||:      "|\        /    \\   /    |\  |\ |.  \    /:  |
 \___|\____\| \_______| \"_____/      \__/     |_\_|_||___|\__/|___|]],
    },
  },
  dim = {
    enabled = true,
    animate = { enabled = false },
  },
  indent = {
    enabled = false,
  },
  input = {
    enabled = true,
    win = {
      border = "single",
      -- https://github.com/folke/snacks.nvim/discussions/376#discussioncomment-11650059
      keys = {
        i_del_word = { "<C-w>", "delete_word", mode = "i" },
      },
      actions = {
        delete_word = function()
          return "<cmd>normal! diw<cr><right>"
        end,
      },
    },
  },
  notifier = {
    enabled = true,
  },
  quickfile = { enabled = true },
  scroll = { enabled = false },
  statuscolumn = {
    enabled = true,
    {
      left = { "mark", "sign" },
      right = { "fold", "git" },
      folds = {
        open = false,
        git_hl = false,
      },
      git = {
        patterns = { "GitSign", "MiniDiffSign" },
      },
      refresh = 50,
    },
  },
  words = { enabled = true },
  terminal = {
    enabled = true,
    bo = {
      filetype = "snacks_terminal",
    },
    win = {
      style = "terminal",
    },
    wo = {
      winbar = "",
    },
  },
})
