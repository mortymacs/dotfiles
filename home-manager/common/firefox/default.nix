{ pkgs, lib, ... }:
{
  programs.firefox = {
    enable = true;
    profiles = {
      main = {
        name = "main";
        isDefault = true;
        containersForce = true;
      };
    };
  };

  # Remove '.mozilla' directory from home.
  home.activation.removeKeepFile = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    rm -rf ~/.mozilla/
  '';
}
