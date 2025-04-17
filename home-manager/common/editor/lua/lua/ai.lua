-- ChatGPT.
require("chatgpt").setup()

-- Avante.
require("avante_lib").load()
require("avante").setup({
  provider = "openai",
  auto_suggestions_provider = "openai",
})

-- Cody.
require("sg").setup()
