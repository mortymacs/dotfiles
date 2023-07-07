-- Dependencies.
local git_blame = require('gitblame')

-- Setup.
require("lualine").setup({
    options = {
        theme = "ayu",
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = "", right = "" },
        component_separators = { left = '', right = ''},
        section_separators = { left = "", right = "" },
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
        lualine_c = {},
        lualine_x = {
            { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
            "branch",
            "diff",
            "diagnostics",
        },
        lualine_y = { "filetype", "filesize" },
        lualine_z = { "progress" },
    },
})
