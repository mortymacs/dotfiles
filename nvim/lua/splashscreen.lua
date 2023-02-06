-- https://github.com/goolord/alpha-nvim/discussions/16#discussioncomment-1309233
-- with customization
local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
    "ooooo      ooo oooooo     oooo ooooo ooo        ooooo",
    "`888b.     `8'  `888.     .8'  `888' `88.       .888'",
    " 8 `88b.    8    `888.   .8'    888   888b     d'888 ",
    " 8   `88b.  8     `888. .8'     888   8 Y88. .P  888 ",
    " 8     `88b.8      `888.8'      888   8  `888'   888 ",
    " 8       `888       `888'       888   8    Y     888 ",
    "o8o        `8        `8'       o888o o8o        o888o",
}
dashboard.section.buttons.val = {
    dashboard.button("e", "  New file",          "<cmd>ene <CR>"),
    dashboard.button("f", "  Find file",         "<Cmd>Files<cr>"),
    dashboard.button("t", "  Find tags",         "<Cmd>Tags<cr>"),
    dashboard.button("g", "  Find word",         "<Cmd>Telescope live_grep<cr>"),
    dashboard.button("b", "  Jump to bookmarks", "<Cmd>Telescope vim_bookmarks all<cr>"),
    dashboard.button("q", "  Exit",              ":q<cr>"),
}
require("alpha").setup(dashboard.opts)
