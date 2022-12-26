require('orgmode').setup_ts_grammar()
require('nvim-treesitter.configs').setup({
  ensure_installed = {
    "c",
    "cpp",
    "rust",
    "go",
    "python",
    "lua",
    "bash",
    "cmake",
    "make",
    "sql",
    "latex",
    "markdown",
    "dockerfile",
    "hcl",
    "json",
    "yaml",
    "toml",
    "html",
    "css",
    "regex",
    "http",
    "org",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'},
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
    colors = {"#c5a3ff", "#ff5733", "#ff85ab", "#5a2790", "#d5465c", "#38a3a5", "#57cc99", "#80ed99"}
  },
})
