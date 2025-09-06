{
  pkgs,
  ...
}:
{
  services.flameshot = {
    enable = true;
    package = pkgs.unstable.flameshot;
    settings = {
      General = {
        # General.
        useGrimAdapter = true;
        disabledTrayIcon = true;
        showStartupLaunchMessage = false;
        showAbortNotification = false;
        historyConfirmationToDelete = false;
        showHelp = false;
        showMagnifier = true;
        showSidePanelButton = false;
        uiColor = "#0f111b";
        drawColor = "#D81E5B";
        drawThickness = 4;

        # Save/Export.
        copyPathAfterSave = true;
      };
    };
  };

  # Need a wrapper to set some env variables before running the commands.
  home.packages = with pkgs; [
    (writeShellScriptBin "flameshot-gui" (builtins.readFile ./flameshot-gui.sh))
  ];
}
