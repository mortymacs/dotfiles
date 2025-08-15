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

-- Avante.
require("avante").setup({
  provider = "openai",
  auto_suggestions_provider = nil,
  suggestion = {
    debounce = 1000,
    throttle = 600,
  },
})
