{
	services.polybar = {
		enable = true;
		extraConfig = builtins.readFile ./config.ini;
		script = "polybar main --log=error &";
	};
}
