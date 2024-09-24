require("util")

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
      winhighlight = "Normal:Pmenu",
      col_offset = -3,
      side_padding = 1,
      border = "single",
    },
    documentation = {
      winhighlight = "Normal:PmenuDoc",
      border = "single",
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
    ["<c-up>"] = cmp.mapping.scroll_docs(-4),
    ["<c-down>"] = cmp.mapping.scroll_docs(4),
    ["<c-space>"] = cmp.mapping.complete(),
    ["<right>"] = cmp.mapping.abort(),
    ["<left>"] = cmp.mapping.abort(),
    ["<esc>"] = cmp.mapping.abort(),
    ["<cr>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer" },
  }),
})

-- Use cmdline & path source for ':'.
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
  floating_window = false,
  handler_opts = {
    border = "single",
  },
  padding = " ",
  transparency = 1,
  close_timeout = 100,
}

-- Rust.
require("crates").setup()

-- C/C++.
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
  cmd = { "clangd", "--clang-tidy", "--compile-commands-dir=build" },
})

-- Go
vim.g.go_auto_type_info = 0
vim.g.go_gopls_enabled = 1
vim.g.go_echo_command_info = 0
vim.g.go_fmt_command = "golines"
vim.g.go_fmt_options = {
  golines = "-m 120",
}
vim.g.go_def_mapping_enabled = 0
lspconfig.gopls.setup({
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    lsp_signature.on_attach(lsp_signature_setup, bufnr)
  end,
  settings = {
    gopls = {
      vulncheck = "Imports",
    },
  },
})

-- Lua
require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})
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

-- Nix.
lspconfig.nil_ls.setup({
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    lsp_signature.on_attach(lsp_signature_setup, bufnr)
  end,
})

-- Shell.
lspconfig.bashls.setup({
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    lsp_signature.on_attach(lsp_signature_setup, bufnr)
  end,
})

-- CMake.
lspconfig.cmake.setup({
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    lsp_signature.on_attach(lsp_signature_setup, bufnr)
  end,
})

-- Terraform.
lspconfig.terraformls.setup({
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    lsp_signature.on_attach(lsp_signature_setup, bufnr)
  end,
})

-- Typst.
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

-- JSON.
lspconfig.jsonls.setup({
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
})

-- YAML.
lspconfig.yamlls.setup({
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = require("schemastore").yaml.schemas(),
    },
  },
})

-- Glance.
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

-- File operations.
require("lsp-file-operations").setup()

-- Status.
require("lsp-progress").setup()

-- Symbol usage.
local SymbolKind = vim.lsp.protocol.SymbolKind
local function h(name)
  return vim.api.nvim_get_hl(0, { name = name })
end
local function text_format(symbol)
  local res = {}

  -- Indicator that shows if there are any other symbols in the same line
  local stacked_functions_content = symbol.stacked_count > 0 and ("+%s"):format(symbol.stacked_count) or ""

  if symbol.references then
    local usage = symbol.references <= 1 and "usage" or "usages"
    local num = symbol.references == 0 and "no" or symbol.references
    table.insert(res, { "󰌹 ", "SymbolUsageRef" })
    table.insert(res, { ("%s %s"):format(num, usage), "SymbolUsageContent" })
  end

  if symbol.definition then
    if #res > 0 then
      table.insert(res, { " ", "NonText" })
    end
    table.insert(res, { "󰳽 ", "SymbolUsageDef" })
    table.insert(res, { symbol.definition .. " defs", "SymbolUsageContent" })
  end

  if symbol.implementation then
    if #res > 0 then
      table.insert(res, { " ", "NonText" })
    end
    table.insert(res, { "󰡱 ", "SymbolUsageImpl" })
    table.insert(res, { symbol.implementation .. " impls", "SymbolUsageContent" })
  end

  if stacked_functions_content ~= "" then
    if #res > 0 then
      table.insert(res, { " ", "NonText" })
    end
    table.insert(res, { " ", "SymbolUsageImpl" })
    table.insert(res, { stacked_functions_content, "SymbolUsageContent" })
  end

  return res
end
require("symbol-usage").setup({
  kinds = {
    SymbolKind.Function,
    SymbolKind.Method,
    SymbolKind.Struct,
    SymbolKind.Interface,
    SymbolKind.Class,
  },
  references = {
    enabled = true,
    include_declaration = false,
  },
  implementation = {
    enabled = true,
  },
  vt_position = "end_of_line",
  text_format = text_format,
})

-- Outline.
require("outline").setup({
  symbols = {
    icons = {
      File = { icon = "󰈔", hl = "Identifier" },
      Module = { icon = "󰆧", hl = "Include" },
      Namespace = { icon = "󰅪", hl = "Include" },
      Package = { icon = "󰏗", hl = "Include" },
      Class = { icon = "", hl = "Type" },
      Method = { icon = "ƒ", hl = "Function" },
      Property = { icon = "", hl = "Identifier" },
      Field = { icon = "󰆨", hl = "Identifier" },
      Constructor = { icon = "", hl = "Special" },
      Enum = { icon = "", hl = "Type" },
      Interface = { icon = "󰜰", hl = "Type" },
      Function = { icon = "󰡱", hl = "Function" },
      Variable = { icon = "", hl = "Constant" },
      Constant = { icon = "", hl = "Constant" },
      String = { icon = "󰅳", hl = "String" },
      Number = { icon = "#", hl = "Number" },
      Boolean = { icon = "", hl = "Boolean" },
      Array = { icon = "󰅪", hl = "Constant" },
      Object = { icon = "", hl = "Type" },
      Key = { icon = "󰌆", hl = "Type" },
      Null = { icon = "NULL", hl = "Type" },
      EnumMember = { icon = "", hl = "Identifier" },
      Struct = { icon = "", hl = "Structure" },
      Event = { icon = "", hl = "Type" },
      Operator = { icon = "+", hl = "Identifier" },
      TypeParameter = { icon = "", hl = "Identifier" },
      Component = { icon = "󰅴", hl = "Function" },
      Fragment = { icon = "󰅴", hl = "Constant" },
      TypeAlias = { icon = " ", hl = "Type" },
      Parameter = { icon = " ", hl = "Identifier" },
      StaticMethod = { icon = " ", hl = "Function" },
      Macro = { icon = "󱟍", hl = "Function" },
    },
  },
})
