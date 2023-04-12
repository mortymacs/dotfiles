-- Colorizer
require('colorizer').setup()
vim.api.nvim_create_autocmd("BufWritePost", { pattern = "*", command = ":ColorizerReloadAllBuffers"})
