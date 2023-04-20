{config, pkgs, ...}:
let
    bg = "#151515";
    fg = "#ECECEC";
    border = "#8136C7";
    selected = "#2F2F2F";
    entry-bg = "#2F2F2F";
    textbox-fg = "#ECECEC";
in
{
	programs.rofi = {
		enable = true;
        plugins = [ pkgs.rofi-emoji ];
        font = "Lexend 10";
		theme = 
            let
                inherit (config.lib.formats.rasi) mkLiteral;
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
            element = {
                children = mkLiteral "[element-text]";
            };
            element-text = {
                background-color = mkLiteral "${bg}";
                text-color = mkLiteral "${fg}";
            };
            "element-text selected" = {
                background-color = mkLiteral "${selected}";
            };
            message = {
                background-color = mkLiteral "${bg}";
            };
            textbox = {
                background-color = mkLiteral "${bg}";
                text-color = mkLiteral "${textbox-fg}";
            };
        };
	};
}
