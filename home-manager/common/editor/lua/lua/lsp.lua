require("util")

-- AI status.
local ai_claude_enabled = vim.env.NVIM_CLAUDE_ENABLED == "true"
local ai_copilot_enabled = vim.env.NVIM_COPILOT_ENABLED == "true"

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
local blink_cmp_providers = {}
local blink_cmp_sources = { "lsp", "path", "buffer" }
if ai_claude_enabled then
  blink_cmp_providers.minuet = {
    name = "minuet",
    module = "minuet.blink",
    async = true,
    timeout_ms = 3000,
    score_offset = 50,
  }
  table.insert(blink_cmp_sources, "minuet")
end
if ai_copilot_enabled then
  blink_cmp_providers.copilot = {
    name = "copilot",
    module = "blink-cmp-copilot",
    score_offset = 100,
    async = true,
  }
  table.insert(blink_cmp_sources, "copilot")
end
require("blink.cmp").setup({
  keymap = {
    ["<m-k>"] = { "select_prev", "fallback" },
    ["<m-j>"] = { "select_next", "fallback" },
    ["<c-k>"] = { "scroll_documentation_up", "fallback" },
    ["<c-j>"] = { "scroll_documentation_down", "fallback" },
    ["<cr>"] = { "select_and_accept", "fallback" },
    ["<esc>"] = { "hide", "fallback" },
  },
  signature = {
    window = { border = "single" },
  },
  completion = {
    documentation = {
      auto_show = false,
      window = { border = "single" },
    },
    trigger = {
      prefetch_on_insert = false,
    },
    menu = {
      border = "single",
      draw = {
        padding = { 2, 2 },
        components = {
          kind_icon = {
            text = function(ctx)
              return " " .. ctx.kind_icon .. ctx.icon_gap .. " "
            end,
          },
        },
        columns = {
          { "label", "label_description", gap = 1 },
          { "kind_icon", "kind" },
        },
        treesitter = { "lsp" },
      },
    },
  },
  sources = {
    default = blink_cmp_sources,
    providers = blink_cmp_providers,
  },
  appearance = {
    nerd_font_variant = "normal",
  },
})
vim.api.nvim_create_autocmd("User", {
  pattern = "BlinkCmpMenuOpen",
  callback = function()
    vim.b.copilot_suggestion_hidden = true
  end,
})
vim.api.nvim_create_autocmd("User", {
  pattern = "BlinkCmpMenuClose",
  callback = function()
    vim.b.copilot_suggestion_hidden = false
  end,
})

-- Set up lspconfig.
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- C/C++.
vim.lsp.enable("clangd", {
  capabilities = capabilities,
  init_options = {
    compilationDatabaseDirectory = "build",
    index = {
      threads = 0,
    },
  },
  cmd = { "clangd", "--clang-tidy", "--compile-commands-dir=build" },
})

-- Rust.
vim.lsp.enable("rust_analyzer", {
  capabilities = capabilities,
})

-- Go
vim.g.go_auto_type_info = 0
vim.g.go_gopls_enabled = 1
vim.g.go_echo_command_info = 0
vim.g.go_def_mapping_enabled = 0
vim.lsp.enable("gopls", {
  capabilities = capabilities,
  settings = {
    gopls = {
      vulncheck = "Imports",
    },
  },
})

-- Zig.
vim.lsp.enable("zls", {
  capabilities = capabilities,
})

-- Lua
vim.lsp.enable("lua_ls", {
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
vim.lsp.enable("ty", {
  capabilities = capabilities,
})

-- Javascript/Typescript.
vim.g.markdown_fenced_languages = {
  "js=javascript",
  "ts=typescript",
}
vim.lsp.enable("denols", {
  capabilities = capabilities,
})
vim.lsp.enable("ts_ls", {
  capabilities = capabilities,
})

-- Nix.
vim.lsp.enable("nil_ls", {
  capabilities = capabilities,
})

-- TF.
vim.lsp.enable("tofu_ls", {
  capabilities = capabilities,
})

-- Shell.
vim.lsp.enable("bashls", {
  capabilities = capabilities,
})

-- CMake.
vim.lsp.enable("neocmake", {
  capabilities = capabilities,
})

-- Terraform.
vim.lsp.enable("terraformls", {
  capabilities = capabilities,
})

-- Typst.
vim.lsp.enable("tinymist", {
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

-- HTML / CSS / Markdown.
vim.lsp.enable("html", {
  capabilities = capabilities,
})
vim.lsp.enable("cssls", {
  capabilities = capabilities,
})

-- JSON.
vim.lsp.enable("jsonls", {
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
})

-- YAML.
vim.lsp.enable("yamlls", {
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = require("schemastore").yaml.schemas(),
    },
  },
})

-- Grammer.
vim.lsp.enable("harper_ls", {
  capabilities = capabilities,
  filetypes = {},
})

-- Status.
require("lsp-progress").setup()

-- Symbol usage.
local SymbolKind = vim.lsp.protocol.SymbolKind
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

-- AI.
if ai_claude_enabled then
  require("minuet").setup({
    cmp = {
      enable_auto_complete = false,
    },
    provider = "claude",
  })
end
if ai_copilot_enabled then
  require("copilot").setup({
    suggestion = { enabled = false },
    panel = { enabled = false },
  })
  require("CopilotChat").setup({
    model = "claude-sonnet-4.5",
  })
end
