require("util")

-- Lua
require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})

-- Tags.
vim.g.fzf_tags_command = "fd | ctags -R --links=no -L-"
vim.g.fzf_lsp_layout = { down = "30%" }
vim.g.fzf_lsp_pretty = false
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

-- Symbols.
require("symbols-outline").setup({
  symbols = {
    File = { icon = "󰈙", hl = "@text.uri" },
    Module = { icon = "", hl = "@namespace" },
    Namespace = { icon = "", hl = "@namespace" },
    Package = { icon = "󰏗", hl = "@namespace" },
    Class = { icon = "󰠱", hl = "@type" },
    Method = { icon = "ƒ", hl = "@method" },
    Property = { icon = "󱈤", hl = "@method" },
    Field = { icon = "󰜢", hl = "@field" },
    Constructor = { icon = "󰩀", hl = "@constructor" },
    Enum = { icon = "", hl = "@type" },
    Interface = { icon = "", hl = "@type" },
    Function = { icon = "󰊕", hl = "@function" },
    Variable = { icon = "󰀫", hl = "@constant" },
    Constant = { icon = "󰏿", hl = "@constant" },
    String = { icon = "󰅳", hl = "@string" },
    Number = { icon = "󰎠", hl = "@number" },
    Boolean = { icon = "", hl = "@boolean" },
    Array = { icon = "󰅨", hl = "@constant" },
    Object = { icon = "", hl = "@type" },
    Key = { icon = "", hl = "@type" },
    Null = { icon = "󰟢", hl = "@type" },
    EnumMember = { icon = "", hl = "@field" },
    Struct = { icon = "󰙅", hl = "@type" },
    Event = { icon = "", hl = "@type" },
    Operator = { icon = "", hl = "@operator" },
    TypeParameter = { icon = "", hl = "@parameter" },
    Component = { icon = "󰡀", hl = "@function" },
    Fragment = { icon = "󰊕", hl = "@constant" },
  },
})

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
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
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

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
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
require("lsp-inlayhints").setup()
local lsp_inlayhints = require("lsp-inlayhints")
local lsp_signature = require("lsp_signature")
local lsp_signature_setup = {
  hint_enable = false,
  handler_opts = {
    border = "none",
  },
  padding = " ",
}
local lsp_inlayhints_setup = {
  assignVariableTypes = true,
  compositeLiteralFields = true,
  constantValues = true,
  functionTypeParameters = true,
  parameterNames = true,
  rangeVariableTypes = true,
}

-- C/C++
lspconfig.clangd.setup({
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    lsp_signature.on_attach(lsp_signature_setup, bufnr)
  end,
  init_options = {
    compilationDatabaseDirectory = "build",
    index = {
      threads = 0,
    },
  },
})

-- Rust
lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    lsp_signature.on_attach(lsp_signature_setup, bufnr)
  end,
})
local rt = require("rust-tools")
rt.setup()
rt.inlay_hints.enable()
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
  settings = {
    gopls = {
      hints = lsp_inlayhints_setup,
      gofumpt = true,
    },
  },
  on_attach = function(client, bufnr)
    lsp_inlayhints.on_attach(client, bufnr)
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

-- Cmake
lspconfig.cmake.setup({
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

-- YAML
local yamlCfg = require("yaml-companion").setup({
  builtin_matchers = {
    kubernetes = { enabled = true },
  },
})
lspconfig.yamlls.setup(yamlCfg)

-- RG
cmp.setup.cmdline({ '"', "'" }, {
  sources = {
    { name = "rg", keyword_length = 2 },
  },
})

-- Comment
require("nvim_comment").setup({
  comment_empty = false,
  create_mappings = false,
})

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

-- Saga
require("lspsaga").setup({
  symbol_in_winbar = {
    separator = " ",
  },
  lightbulb = {
    enable = false,
  },
  finder = {
    keys = {
      expand_or_jump = "<enter>",
    },
  },
  outline = {
    keys = {
      expand_or_jump = "<enter>",
    },
  },
  implement = {
    enable = true,
    sign = true,
    virtual_text = false,
  },
})

-- Lens.
require("lsp-lens").setup()

-- Rename.
require("inc_rename").setup()
