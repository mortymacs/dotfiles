{
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 5d --keep 5";
  };

  # Custom config.
  xdg.configFile = {
    # Most.
    "most/mostrc".source = ./mostrc;
    # Procs.
    "procs/config.toml".source = ./procs.toml;
    # Clang.
    "clangd/config.yaml".source = ./clangd.yaml;
    "clangd/clang-format".source = ./clang-format;
    # Node.
    "npm/npmrc".source = ./npmrc;
  };

  # AWS CLI config.
  home.activation = {
    createAwsConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
            if [ ! -f "${config.xdg.configHome}/aws/config" ]; then
              $DRY_RUN_CMD mkdir -p "${config.xdg.configHome}/aws"
              $DRY_RUN_CMD cat > "${config.xdg.configHome}/aws/config" << EOF
      [profile localstack]
      region = us-east-1
      EOF
            fi
            if [ ! -f "${config.xdg.configHome}/aws/credentials" ]; then
              $DRY_RUN_CMD mkdir -p "${config.xdg.configHome}/aws"
              $DRY_RUN_CMD cat > "${config.xdg.configHome}/aws/credentials" << EOF
      [localstack]
      aws_access_key_id = foo
      aws_secret_access_key = bar
      EOF
            fi
    '';
  };

  # AI.
  services.ollama = {
    enable = true;
    acceleration = "cuda";
    host = "127.0.0.1";
    package = pkgs.unstable.ollama;
  };

  # Nix Index.
  programs.nix-index = {
    enable = true;
  };
}
