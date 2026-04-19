{ pkgs, ...}:
{
  # Zed.
  programs.zed-editor = {
    enable = true;
    package = pkgs.unstable.zed-editor;
  };
}
