-- Lualine
require("lualine").setup({
    options = {
        theme = "github_dark",
        section_separators = { left = "", right = "" },
        component_separators = "",
        globalstatus = true,
        disabled_filetypes = { "fzf" },
    },
    sections = {
        lualine_a = {
            {
                "filename",
                newfile_status = true,
                path = 1,
                symbols = {
                    modified = "[+]",
                    readonly = "[-]",
                    unnamed = "[No Name]",
                    newfile = "[New]",
                },
            },
        },
        lualine_b = {},
        lualine_c = { "lsp_progress" },
        lualine_x = { "branch", "diff", "diagnostics" },
        lualine_y = { "filetype", "filesize" },
        lualine_z = { "progress" },
    },
})
vim.cmd("set cmdheight=0")
vim.cmd("set laststatus=3")

-- Trouble
require("trouble").setup({
    indent_lines = false,
})
