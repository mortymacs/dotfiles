{ pkgs, inputs, hasCuda ? false, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
  llamaCppPkg = if hasCuda then inputs.llama-cpp.packages.${system}.cuda else inputs.llama-cpp.packages.${system}.default;
  llamaCpp = llamaCppPkg.overrideAttrs (old: {
    cmakeFlags = (old.cmakeFlags or [ ]) ++ [ "-DLLAMA_BUILD_WEBUI=OFF" ];
  });
in
{
  services.ollama = {
    enable = true;
    host = "127.0.0.1";
    package = pkgs.unstable.ollama;
  } // (if hasCuda then { acceleration = "cuda"; } else { });

  home.packages = with pkgs; [
    unstable.crush
    llamaCpp
    unstable.claude-code
  ];

  xdg.configFile = {
    "crush/crush.json".source = ./crush.json;
  };
}
