-- Lua
require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
})

-- Diagnostic
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = false,
    update_in_insert = true,
    severity_sort = false,
})
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Tags
vim.g.fzf_tags_command = "fd | ctags -R --links=no -L-"

-- CMP
local lspkind = require('lspkind')
local cmp = require('cmp')
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
        },
    },
    formatting = {
        fields = { "abbr", "kind", "menu" },
        format = lspkind.cmp_format({
            mode = "symbol_text",
            symbol_map = {
                Variable = "",
            },
        })
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs( -4),
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
        { name = 'path' },
    }, {
        { name = "crates" },
    }, {
        { name = 'nvim_lua' },
    }, {
        { name = 'nvim_lsp_signature_help' },
    }),
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

local lspSignatureConfig = {
    hint_prefix = "🚥 ",
    handler_opts = {
        border = "single"
    },
}

-- Set up lspconfig.
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Go
require('go').setup()
vim.g.go_auto_type_info = 0
vim.g.go_gopls_gofumpt = 1
vim.g.go_gopls_enabled = 1
vim.g.go_fmt_command = "golines"
vim.g.go_fmt_options = {
    golines = '-m 128 --base-formatter gofumpt'
}
vim.g.go_def_mapping_enabled = 0
lspconfig.gopls.setup({
    capabilities = capabilities,
})

-- Lua
lspconfig.sumneko_lua.setup({
    capabilities = capabilities,
})

-- Python
lspconfig.pyright.setup({
    capabilities = capabilities,
})

-- PHP
lspconfig.phpactor.setup({
    init_options = {
        ["language_server_phpstan.enabled"] = false,
        ["language_server_psalm.enabled"] = false,
    }
})

-- Nix
lspconfig.rnix.setup({
    capabilities = capabilities,
})

-- XML
-- https://gist.github.com/ptitfred/3402279
vim.api.nvim_create_autocmd("BufWritePre",
    { pattern = "*.xml", command = ":silent %!xmllint --format --encode UTF-8 --recover - 2>/dev/null" })

-- JSON
vim.api.nvim_create_autocmd("BufWritePre", { pattern = "*.json", command = ":%!jq" })

-- RG
cmp.setup.cmdline({ '"', "'" }, {
    sources = {
        { name = "rg", keyword_length = 2 },
    },
})

require('nvim_comment').setup({
    comment_empty = false,
    create_mappings = false,
})

-- LSP Saga.
require("lspsaga").setup()
