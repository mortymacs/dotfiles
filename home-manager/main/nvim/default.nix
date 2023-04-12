{pkgs, ...}:
{
  programs.neovim = {
  	enable = true;
    vimAlias = true;
    viAlias = true;
	plugins = with pkgs.vimPlugins; [
        # Theme.
        {
            plugin = neovim-ayu;
            type = "lua";
            config = builtins.readFile ./theme.lua;
        }
        nvim-web-devicons

        # Body.
		barbar-nvim
        {
            plugin = bufferline-nvim;
            type = "lua";
            config = builtins.readFile ./tabbar.lua;
        }
        {
            plugin = lualine-nvim;
            type = "lua";
            config = builtins.readFile ./lualine.lua;
        }
        {
            plugin = nvim-notify;
            type = "lua";
            config = builtins.readFile ./notification.lua;
        }
        {
            plugin = noice-nvim;
            type = "lua";
            config = builtins.readFile ./noice.lua;
        }
        {
            plugin = alpha-nvim;
            type = "lua";
            config = builtins.readFile ./splashscreen.lua;
        }

        # Colors.
        {
            plugin = nvim-colorizer-lua;
            type = "lua";
            config = builtins.readFile ./misc.lua;
        }

        # Keybinding.
        {
            plugin = which-key-nvim;
            type = "lua";
            config = builtins.readFile ./keymap.lua;
        }
        legendary-nvim

        # File manager.
        fzf-vim
        {
            plugin = nvim-tree-lua;
            type = "lua";
            config = builtins.readFile ./fm.lua;
        }

        # Git.
        {
            plugin = gitsigns-nvim;
            type = "lua";
            config = builtins.readFile ./git.lua;
        }

        # Development.
        {
            plugin = toggleterm-nvim;
            type = "lua";
            config = builtins.readFile ./terminal.lua;
        }
        {
            plugin = nvim-treesitter.withAllGrammars;
            type = "lua";
            config = builtins.readFile ./treesitter.lua;
        }
        nvim-treesitter-context
        zeavim-vim
        {
            plugin = telescope-nvim;
            type = "lua";
            config = builtins.readFile ./telescope.lua;
        }
        {
            plugin = todo-comments-nvim;
            type = "lua";
            config = "require('todo-comments').setup({signs = false})";
        }
        vim-bookmarks
        telescope-vim-bookmarks-nvim

        # LSP.
        neodev-nvim
        lspkind-nvim
        nvim-cmp
        cmp-nvim-lsp
        cmp-nvim-lsp-signature-help
        {
            plugin = nvim-lspconfig;
            type = "lua";
            config = builtins.readFile ./lsp.lua;
        }
        {
            plugin = fzf-lsp-nvim;
            type = "lua";
            config = "require('fzf_lsp').setup()";
        }
        lspsaga-nvim
# lsp-lens-nvim
        vim-vsnip
        go-nvim
        nvim-comment

        # Debug.
        {
            plugin = nvim-dap;
            type = "lua";
            config = builtins.readFile ./debug.lua;
        }
        nvim-dap-ui
        nvim-dap-virtual-text
        telescope-dap-nvim

        # Misc.
        plenary-nvim
        {
            plugin = numb-nvim;
            type = "lua";
            config = "require('numb').setup()";
        }
        {
            plugin = vim-illuminate;
            type = "lua";
            config = "require('illuminate').configure({filetypes_denylist = {'alpha', 'NvimTree'}})";
        }
	];
	extraLuaConfig = builtins.readFile ./vim.lua;
  };
}
