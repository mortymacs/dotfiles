{ config, pkgs, ... }:
let
  bg = "#0B1015";
  fg = "#FCFCFC";
  border = "#27213C";
  selected = "#161927";
  entry-bg = "#161927";
  textbox-fg = "#FCFCFC";
in {
  programs.rofi = {
    enable = true;
    plugins = [ pkgs.rofi-emoji ];
    font = "sans-serif 10";
    theme = let inherit (config.lib.formats.rasi) mkLiteral;
    in {
      window = {
        padding = 5;
        border = 1;
        background-color = mkLiteral "${bg}";
        border-color = mkLiteral "${border}";
        children = mkLiteral "[mainbox]";
      };
      mainbox = {
        background-color = mkLiteral "${bg}";
        children = mkLiteral "[inputbar,message,listview]";
      };
      inputbar = {
        background-color = mkLiteral "${bg}";
        border = 0;
        children = mkLiteral "[entry]";
      };
      prompt = {
        background-color = "${bg}";
        text-color = mkLiteral "${fg}";
      };
      entry = {
        border = 1;
        background-color = mkLiteral "${entry-bg}";
        border-color = mkLiteral "${border}";
        text-color = mkLiteral "${fg}";
      };
      listview = {
        background-color = mkLiteral "${bg}";
        text-color = mkLiteral "${fg}";
        lines = 3;
        children = mkLiteral "[element]";
      };
      element = { children = mkLiteral "[element-text]"; };
      element-text = {
        background-color = mkLiteral "${bg}";
        text-color = mkLiteral "${fg}";
      };
      "element-text selected" = { background-color = mkLiteral "${selected}"; };
      message = { background-color = mkLiteral "${bg}"; };
      textbox = {
        background-color = mkLiteral "${bg}";
        text-color = mkLiteral "${textbox-fg}";
      };
    };
  };
}
