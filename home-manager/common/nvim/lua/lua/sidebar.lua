local builtin = require("statuscol.builtin")
require("statuscol").setup({
  relculright = true,
  bt_ignore = { "nofile" },
  ft_ignore = { "terminal", "Outline", "toggleterm" },
  segments = {
    {
      sign = { name = { ".*" }, namespace = { "gitsigns", "qf" }, maxwidth = 1, colwidth = 1, auto = false },
      click = "v:lua.ScSa",
    },
    {
      sign = { name = { "DapBreakpoint" }, maxwidth = 1, colwidth = 1, auto = false },
      click = "v:lua.ScSa",
    },
    {
      text = { " ", builtin.lnumfunc, "  " },
      click = "v:lua.ScLa",
    },
  },
})
