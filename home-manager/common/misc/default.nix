{
  lib,
  config,
  ...
}:
{
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

  # AWS CLI config.
  home.activation = {
    createAwsConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
            if [ ! -f "${config.home.homeDirectory}/.config/aws/config" ]; then
              $DRY_RUN_CMD mkdir -p "${config.home.homeDirectory}/.config/aws"
              $DRY_RUN_CMD cat > "${config.home.homeDirectory}/.config/aws/config" << EOF
      [profile localstack]
      region = us-east-1
      EOF
            fi
            if [ ! -f "${config.home.homeDirectory}/.config/aws/credentials" ]; then
              $DRY_RUN_CMD mkdir -p "${config.home.homeDirectory}/.config/aws"
              $DRY_RUN_CMD cat > "${config.home.homeDirectory}/.config/aws/credentials" << EOF
      [localstack]
      aws_access_key_id = foo
      aws_secret_access_key = bar
      EOF
            fi
    '';
  };

  # Nix Index.
  programs.nix-index = {
    enable = true;
  };
}
