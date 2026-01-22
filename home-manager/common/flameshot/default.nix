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
}
