require("util")

-- Lua
require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})

-- Tags.
vim.g.fzf_tags_command = "fd | ctags -R --links=no -L-"
vim.g.fzf_lsp_pretty = true
require("fzf_lsp").setup()

-- Kind.
require("lspkind").init({
  symbol_map = {
    Constructor = "󰩀",
    Module = "",
    EnumMember = "",
    Property = "󱈤",
  },
})
local lspkind = require("lspkind")

-- CMP.
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  window = {
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding = 1,
      border = "none",
    },
  },
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = lspkind.cmp_format({
      mode = "symbol_text",
      symbol_map = {
        Variable = "",
      },
    }),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-Up>"] = cmp.mapping.scroll_docs(-4),
    ["<C-Down>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<Right>"] = cmp.mapping.abort(),
    ["<Left>"] = cmp.mapping.abort(),
    ["<cr>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "vsnip" },
  }, {
    { name = "treesitter" },
  }, {
    { name = "buffer" },
  }, {
    { name = "path" },
  }, {
    { name = "crates" },
  }, {
    { name = "nvim_lua" },
  }),
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = "buffer" },
  }),
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

-- Set up lspconfig.
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_signature = require("lsp_signature")
local lsp_signature_setup = {
  hint_enable = false,
  handler_opts = {
    border = "single",
  },
  padding = " ",
  transparency = 1,
  close_timeout = 100,
}

-- Rust
lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    lsp_signature.on_attach(lsp_signature_setup, bufnr)
  end,
})
require("crates").setup()

-- Go
vim.g.go_auto_type_info = 0
vim.g.go_gopls_gofumpt = 1
vim.g.go_gopls_enabled = 1
vim.g.go_echo_command_info = 0
vim.g.go_fmt_command = "golines"
vim.g.go_fmt_options = {
  golines = "-m 120 --base-formatter gofumpt",
}
vim.g.go_def_mapping_enabled = 0
lspconfig.gopls.setup({
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    lsp_signature.on_attach(lsp_signature_setup, bufnr)
  end,
})

-- Lua
lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    lsp_signature.on_attach(lsp_signature_setup, bufnr)
  end,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

-- Python
lspconfig.pyright.setup({
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    lsp_signature.on_attach(lsp_signature_setup, bufnr)
  end,
})

-- Javascript/Typescript.
vim.g.markdown_fenced_languages = {
  "js=javascript",
  "ts=typescript",
}
lspconfig.denols.setup({
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    lsp_signature.on_attach(lsp_signature_setup, bufnr)
  end,
})

-- Nix
lspconfig.nil_ls.setup({
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    lsp_signature.on_attach(lsp_signature_setup, bufnr)
  end,
})

-- Shell
lspconfig.bashls.setup({
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    lsp_signature.on_attach(lsp_signature_setup, bufnr)
  end,
})

-- Terraform
lspconfig.terraformls.setup({
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    lsp_signature.on_attach(lsp_signature_setup, bufnr)
  end,
})

-- Typst
lspconfig.typst_lsp.setup({
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    lsp_signature.on_attach(lsp_signature_setup, bufnr)
  end,
})

-- Dot.
lspconfig.dotls.setup({
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    lsp_signature.on_attach(lsp_signature_setup, bufnr)
  end,
})

-- HTML / CSS / Markdown.
lspconfig.html.setup({
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    lsp_signature.on_attach(lsp_signature_setup, bufnr)
  end,
})
lspconfig.cssls.setup({
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    lsp_signature.on_attach(lsp_signature_setup, bufnr)
  end,
})

-- JSON
lspconfig.jsonls.setup({
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    lsp_signature.on_attach(lsp_signature_setup, bufnr)
  end,
})

-- YAML
local yamlCfg = require("yaml-companion").setup({
  builtin_matchers = {
    kubernetes = { enabled = true },
  },
})
lspconfig.yamlls.setup(yamlCfg)

-- Glance
require("glance").setup({
  preview_win_opts = {
    cursorline = false,
  },
  folds = {
    fold_closed = ">",
    fold_open = "v",
    folded = true,
  },
})

-- Lens.
require("lsp-lens").setup()

-- Rename.
require("inc_rename").setup()

-- Status.
require("lsp-progress").setup()
