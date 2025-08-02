-- Copilot.
require("copilot").setup({
  panel = {
    enabled = true,
  },
  suggestion = {
    enabled = true,
  },
})
require("copilot.suggestion").toggle_auto_trigger()
require("CopilotChat").setup()
