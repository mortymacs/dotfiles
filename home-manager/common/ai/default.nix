{ pkgs, inputs, ... }:
{
  services.ollama = {
    enable = true;
    acceleration = "cuda";
    host = "127.0.0.1";
    package = pkgs.unstable.ollama;
  };

  home.packages = with pkgs; [
    unstable.crush
    inputs.llama-cpp.packages.${pkgs.stdenv.hostPlatform.system}.cuda
    unstable.claude-code
  ];

  xdg.configFile = {
    "crush/crush.json".source = ./crush.json;
  };
}
