{ pkgs, inputs, hasCuda ? false, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  services.ollama = {
    enable = true;
    host = "127.0.0.1";
    package = pkgs.unstable.ollama;
  } // (if hasCuda then { acceleration = "cuda"; } else { });

  home.packages = with pkgs; [
    unstable.crush
    (if hasCuda then inputs.llama-cpp.packages.${system}.cuda else inputs.llama-cpp.packages.${system}.default)
    unstable.claude-code
  ];

  xdg.configFile = {
    "crush/crush.json".source = ./crush.json;
  };
}
