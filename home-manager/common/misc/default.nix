{ pkgs, lib, config, ... }:
{
  # Services.
  services = {
    cliphist = {
      enable = true;
      systemdTarget = "sway-session.target";
    };
  };

  # Custom config.
  xdg.configFile = {
    # Most.
    "most/mostrc".source = ./mostrc;
    # Procs.
    "procs/config.toml".source = ./procs.toml;
    # Bat.
    "bat/themes/ayu-dark.tmTheme".source = ./ayu-dark.tmTheme;
    # Clangd.
    "clangd/config.yaml".source = ./clangd.yaml;
  };

  # Check if AWS config file exists and conditionally add it.
  home.file =
    lib.optionalAttrs (!builtins.pathExists "${toString (config.home.homeDirectory)}/.aws/config")
      {
        ".aws/config".text = ''
          [profile localhost]
          region = us-east-1
        '';
        ".aws/credentials".text = ''
          [localstack]
          aws_access_key_id = foo
          aws_secret_access_key = bar
        '';
      };
}
