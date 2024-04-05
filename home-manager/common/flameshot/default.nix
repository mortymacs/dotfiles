{ pkgs, ... }:
let
  # https://github.com/NixOS/nixpkgs/issues/292700#issuecomment-1974953531
  flameshotWayland = pkgs.flameshot.overrideAttrs (oldAttrs: {
    cmakeFlags = [ "-DUSE_WAYLAND_CLIPBOARD=1" ];
    buildInputs = oldAttrs.buildInputs ++ [ pkgs.libsForQt5.kguiaddons ];
  });
in {
  services.flameshot = {
    enable = true;
    package = flameshotWayland;
    settings = {
      General = {
        # General.
        disabledTrayIcon = true;
        showStartupLaunchMessage = false;
        checkForUpdates = false;
        historyConfirmationToDelete = false;
        showHelp = false;
        showMagnifier = true;
        showSidePanelButton = false;
        uiColor = "#0f111b";
        drawColor = "#D81E5B";
        buttons = "";

        # Save/Export.
        copyPathAfterSave = true;
        copyAndCloseAfterUpload = false;
      };
    };
  };
}
