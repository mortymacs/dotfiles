require("util")

-- Kind.
local lspkind = require("lspkind")
lspkind.init({
  symbol_map = {
    Constructor = "󰩀",
    Module = "",
    EnumMember = "",
    Property = "󱈤",
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
    ["<a-j>"] = cmp.mapping.select_next_item(),
    ["<a-k>"] = cmp.mapping.select_prev_item(),
    ["<c-up>"] = cmp.mapping.scroll_docs(-4),
    ["<c-down>"] = cmp.mapping.scroll_docs(4),
    ["<c-space>"] = cmp.mapping.complete(),
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

-- Rust.
require("crates").setup()

-- C/C++.
lspconfig.clangd.setup({
  capabilities = capabilities,
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
vim.g.go_def_mapping_enabled = 0
lspconfig.gopls.setup({
  capabilities = capabilities,
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
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

-- Python.
lspconfig.pyright.setup({
  capabilities = capabilities,
})

-- Javascript/Typescript.
vim.g.markdown_fenced_languages = {
  "js=javascript",
  "ts=typescript",
}
lspconfig.denols.setup({
  capabilities = capabilities,
})

-- Nix.
lspconfig.nil_ls.setup({
  capabilities = capabilities,
})

-- Shell.
lspconfig.bashls.setup({
  capabilities = capabilities,
})

-- SQL.
lspconfig.postgres_lsp.setup({
  capabilities = capabilities,
})

-- CMake.
lspconfig.neocmake.setup({
  capabilities = capabilities,
})

-- Terraform.
lspconfig.terraformls.setup({
  capabilities = capabilities,
})

-- Typst.
lspconfig.tinymist.setup({
  capabilities = capabilities,
  offset_encoding = "utf-8",
})
require("typst-preview").setup({
  dependencies_bin = {
    ["tinymist"] = vim.fn.exepath("tinymist"),
    ["websocat"] = vim.fn.exepath("websocat"),
  },
  extra_args = {
    "--font-path=fonts",
  },
})

-- Dot.
lspconfig.dotls.setup({
  capabilities = capabilities,
})

-- HTML / CSS / Markdown.
lspconfig.html.setup({
  capabilities = capabilities,
})
lspconfig.cssls.setup({
  capabilities = capabilities,
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
  vt_priority = 60,
  text_format = text_format,
})

-- LSP Endhints.
require("lsp-endhints").setup({
  icons = {
    type = "󰜁 ",
    parameter = "󰏪 ",
    offspec = " ", -- hint kind not defined in official LSP spec
    unknown = " ", -- hint kind is nil
  },
  label = {
    padding = 1,
    marginLeft = 0,
    bracketedParameters = true,
  },
  autoEnableHints = true,
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
