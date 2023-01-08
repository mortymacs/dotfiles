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
})
require("telescope").load_extension("yaml_schema")
