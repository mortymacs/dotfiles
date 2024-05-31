{
  services.flameshot = {
    enable = true;
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
