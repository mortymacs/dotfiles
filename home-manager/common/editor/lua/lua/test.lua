require("neotest").setup({
  icons = {
    child_indent = "│",
    child_prefix = "├",
    collapsed = "─",
    expanded = "┐",
    final_child_indent = " ",
    final_child_prefix = "└",
    non_collapsible = "─",
  },
  adapters = {
    require("neotest-python"),
    require("neotest-go"),
  },
})
