{ pkgs, ...}:
{
    packageOverrides = pkgs: with pkgs; rec {
        internalMonitor = writeText "internal-monitor" ''
        #!/bin/sh
        xrandr --output eDP-1 --primary --mode 2048x1152 --pos 0x1080 --rotate normal --output DP-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-2 --off
        '';
        myPackage = pkgs.buildEnv {
            name = "dualMonitor";
            paths = [
                (runCommand "dualMonitor" {} ''
                 cp "${internalMonitor}" "$out/usr/local/bin/dual-monitor.sh
                '')
            ];
        };
    };
}
