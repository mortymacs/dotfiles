local builtin = require("statuscol.builtin")
require("statuscol").setup({
  relculright = true,
  bt_ignore = { "nofile" },
  ft_ignore = { "terminal", "Outline", "toggleterm", "fzf" },
  segments = {
    {
      sign = { namespace = { "diagnostic/signs" }, maxwidth = 1, colwidth = 1, auto = true },
      click = "v:lua.ScSa",
    },
    {
      sign = { name = { ".*" }, namespace = { "gitsigns", "qf" }, maxwidth = 1, colwidth = 1, auto = true },
      click = "v:lua.ScSa",
    },
    {
      sign = { name = { "DapBreakpoint" }, maxwidth = 1, colwidth = 1, auto = true },
      click = "v:lua.ScSa",
    },
    {
      text = { " ", builtin.lnumfunc, "  " },
      click = "v:lua.ScLa",
    },
  },
})
