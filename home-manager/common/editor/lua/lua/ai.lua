-- ChatGPT.
require("chatgpt").setup()

-- Avante.
require("avante_lib").load()
require("avante").setup({
  provider = "cody",
  auto_suggestions_provider = "cody",
})
