{ pkgs, inputs, ... }:
{
  # Neovim.
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    defaultEditor = true;
    package = pkgs.unstable.neovim-unwrapped;
  };
  xdg.configFile.nvim = {
    source = ./lua;
    recursive = true;
  };

  # Helix.
  programs.helix = {
    enable = true;
    package = pkgs.helix;
    settings = {
      theme = "bogster-custom";
      editor = {
        line-number = "relative";
        clipboard-provider = "wayland";
        trim-final-newlines = true;
        trim-trailing-whitespace = true;
      };
      keys.normal = {
        "C-c" = {
          "C-l" = ":format";
        };
        "C-s" = ":wa";
      };
      keys.insert = {
        "C-c" = {
          "C-l" = ":format";
        };
        "C-s" = ":wa";
      };
    };
    themes = {
      bogster-custom = {
        inherits = "bogster";
        "ui.background" = { };
        "ui.background.separator" = { };
        "ui.window" = { };
        "ui.popup.info" = { };
        "ui.picker.header" = { };
      };
    };
  };

  # IPython.
  xdg.configFile.ipython = {
    source = ./ipython;
    recursive = true;
  };
}
