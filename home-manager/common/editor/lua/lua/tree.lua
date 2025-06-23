require("neo-tree").setup({
  enable_modified_markers = false,
  hide_root_node = true,
  retain_hidden_root_indent = false,
  popup_border_style = "single",
  source_selector = {
    sources = {
      {
        source = "filesystem",
        display_name = " 󰉕 Files ",
      },
      {
        source = "buffers",
        display_name = "  Buffers ",
      },
      {
        source = "git_status",
        display_name = "  Git ",
      },
    },
  },
  default_component_configs = {
    diagnostics = {
      symbols = {
        hint = "󰸥",
        info = "󰵚",
        warn = "",
        error = "",
      },
    },
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = true,
      hide_hidden = true,
      hide_by_name = {
        ".venv",
        "venv",
        ".git",
        "vendor",
        ".DS_Store",
        ".idea",
        ".vscode",
      },
      always_show = {
        ".gitignore",
        ".github",
        ".gitlab-ci.yml",
      },
    },
    use_libuv_file_watcher = true,
  },
})
