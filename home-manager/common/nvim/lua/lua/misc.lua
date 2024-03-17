-- Large files.
require("bigfile").setup({
  filesize = 2,
  pattern = { "*" },
  features = {
    "indent_blankline",
    "illuminate",
    "lsp",
    "treesitter",
    "matchparen",
    "vimopts",
  },
})

-- Body structure.
require("edgy").setup({
  bottom = {
    {
      ft = "toggleterm",
      size = { height = 0.4 },
      filter = function(buf, win)
        return vim.api.nvim_win_get_config(win).relative == ""
      end,
    },
    { ft = "qf", title = "QuickFix" },
    {
      ft = "help",
      size = { height = 20 },
      filter = function(buf)
        return vim.bo[buf].buftype == "help"
      end,
    },
  },
  left = {
    {
      title = "󰉕 Files",
      ft = "neo-tree",
      filter = function(buf)
        return vim.b[buf].neo_tree_source == "filesystem"
      end,
      pinned = true,
      open = "Neotree filesystem",
    },
    {
      title = " Git",
      ft = "neo-tree",
      filter = function(buf)
        return vim.b[buf].neo_tree_source == "git_status"
      end,
      pinned = true,
      open = "Neotree git_status",
    },
    {
      title = " Symbols",
      ft = "neo-tree",
      pinned = true,
      open = "Neotree document_symbols",
    },
  },
  animate = {
    enabled = false,
  },
  keys = {
    ["q"] = function(win)
      win:close()
    end,
    ["<c-]>"] = function(win)
      win:hide()
    end,
  },
  ["<m-Down>"] = function(win)
    win:next({ visible = true, focus = true })
  end,
  ["<m-Up>"] = function(win)
    win:prev({ visible = true, focus = true })
  end,
  icons = {
    closed = " ",
    open = " ",
  },
})
