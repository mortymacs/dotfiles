{pkgs, ...}:
{
    home.packages = with pkgs; [
        (writeShellScriptBin "monitor-internal" (builtins.readFile ./monitor-internal.sh))
        (writeShellScriptBin "monitor-external" (builtins.readFile ./monitor-external.sh))
    ];
}
