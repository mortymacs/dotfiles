-- ChatGPT.
require("chatgpt").setup()

-- Avante.
require("avante_lib").load()
require("avante").setup({
  provider = "openai",
  auto_suggestions_provider = "openai",
  windows = {
    sidebar_header = {
      rounded = false,
    },
  },
})

-- Cody.
require("sg").setup({
  enable_cody = vim.fn.getenv("SRC_CODY_STATUS") == "1" and true or false,
})