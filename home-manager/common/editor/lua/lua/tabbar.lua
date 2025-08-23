require("barbar").setup({
  animation = false,
  auto_hide = true,
  tabpages = false,
  icons = {
    button = "",
    separator = { left = "󰇝", right = "" },
  },
  sidebar_filetypes = {
    ["neo-tree"] = {
      text = "File Explorer",
      align = "center",
    },
  },
})
