{ inputs, pkgs, ...}:
{
  # Zed.
  programs.zed-editor = {
    enable = true;
    package = inputs.zed-editor.packages.${pkgs.system}.default;
  };
}
