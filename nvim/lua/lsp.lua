-- Rust
require('crates').setup()

local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  window = {},
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<cr>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  }, {
    { name = "crates" },
  }, {
    { name = 'nvim_lua' },
  }, {
    { name = 'orgmode' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').rust_analyzer.setup({
    capabilities = capabilities
})
require('lspconfig').pyright.setup({
    capabilities = capabilities
})

-- Show method signature
-- vim.api.nvim_create_autocmd("CursorHold", {callback = vim.lsp.buf.signature_help})

-- Go
vim.g.go_auto_type_info = 0
vim.g.go_gopls_gofumpt=1
vim.g.go_gopls_enabled=1
vim.g.go_fmt_command = "golines"
vim.g.go_fmt_options = "{'golines': '-m 128 --base-formatter gofumpt'}"
vim.g.go_def_mapping_enabled = 0
require('lspconfig').gopls.setup({
    capabilities = capabilities
})

-- XML
-- https://gist.github.com/ptitfred/3402279
vim.api.nvim_create_autocmd("BufWritePre", {pattern = "*.xml", command = ":silent %!xmllint --format --encode UTF-8 --recover - 2>/dev/null"})

-- JSON
vim.api.nvim_create_autocmd("BufWritePre", {pattern = "*.json", command = ":%!jq"})

-- RG
cmp.setup.cmdline({'"', "'"}, {
  sources = {
    { name = "rg", keyword_length = 2 },
  },
})

require('nvim_comment').setup({
  comment_empty = false,
  create_mappings = false,
})

-- ALE
vim.g.ale_disable_lsp = 1
vim.g.ale_set_loclist = 0
vim.g.ale_set_quickfix = 1
vim.g.ale_fixers = "{'*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['black', 'isort']}"

-- Indent Blankline
vim.opt.list = true
require("indent_blankline").setup({
  show_current_context = true,
  show_current_context_start = true,
})
