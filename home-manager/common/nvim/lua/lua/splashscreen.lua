-- https://github.com/goolord/alpha-nvim/discussions/16#discussioncomment-1309233
-- with customization
local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
    "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
    "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
    "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
    "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
    "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
    "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
}
dashboard.section.buttons.val = {
    dashboard.button("n", "  New file",          "<cmd>ene <CR>"),
    dashboard.button("f", "󰱼  Find file",         "<Cmd>Files<cr>"),
    dashboard.button("t", "  Find tags",         "<Cmd>Tags<cr>"),
    dashboard.button("g", "󱎸  Find word",         "<Cmd>Telescope live_grep<cr>"),
    dashboard.button("b", "  Jump to bookmarks", "<Cmd>Telescope vim_bookmarks all<cr>"),
    dashboard.button("q", "  Exit",              ":q<cr>"),
}
require("alpha").setup(dashboard.opts)
