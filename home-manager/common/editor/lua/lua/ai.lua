-- Copilot.
if os.getenv("NVIM_COPILOT_ENABLE") == "true" then
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
end

-- Avante.
if os.getenv("NVIM_AVANTE_ENABLE") == "true" then
  require("avante").setup({
    provider = "openai",
    auto_suggestions_provider = nil,
    suggestion = {
      debounce = 1000,
      throttle = 600,
    },
    windows = {
      sidebar_header = {
        enabled = false,
      },
    },
    edit = {
      border = "single",
    },
    ask = {
      floating = true,
      border = "single",
    },
    selector = {
      provider = "snacks",
    },
  })
end
