-- Copilot.
require("copilot").setup({
  panel = {
    enabled = true,
  },
  suggestion = {
    enabled = true,
    keymap = {
      accept = "<tab>",
    },
  },
})
require("copilot.suggestion").toggle_auto_trigger()
require("CopilotChat").setup()
