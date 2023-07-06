{
  services.sxhkd = {
    enable = true;
    keybindings = {
      # -- Applications.
      # Terminal.
      "super + Return" = "alacritty msg create-window 2>/dev/null || alacritty";

      # Launcher.
      "super + d" = "rofi -show run";

      # Clipboard.
      "super + c" = "rofi -modi 'clipboard:greenclip print' -show clipboard";

      # File manager.
      "super + f" = "rofi -show filebrowser";

      # Emoji.
      "super + e" = "rofi -modi emoji -show emoji";

      # Switch windows.
      "super + Tab" = "rofi -show window";

      # Switch monitors.
      "super + shift + i" = "monitor-internal";
      "super + shift + c" = "monitor-external";

      # Screenshot.
      "super + shift + s" = "flameshot gui";

      # Zeal.
      "super + shift + z" = "zeal";

      # -- Sxhkd.
      # Reload.
      "super + shift + r" = "pkill -USR1 -x sxhkd";

      # -- Bspwm.
      # Quit/restart.
      "super + shift + e" = "bspc {quit,wm -r}";

      # Close.
      "super + shift + q" = "bspc node -{c,k}";

      # swap the current node and the biggest window
      "super + w + g" = "bspc node -s biggest.window";

      # Lock screen.
      "super + l" = "XSECURELOCK_FONT=sans xsecurelock";

      # -- Focus/swap.
      # Focus.
      "super + {Left,Down,Up,Right}" = "bspc node -f {west,south,north,east}";

      # Swap.
      "super + alt + {Left,Down,Up,Right}" =
        "bspc node -s {west,south,north,east}";

      # Fullscreen/tiled.
      "super + shift + Up" = "bspc desktop -l next";
      "super + shift + Down" = "bspc desktop -l prev";

      # -- Workspace.
      # Next/previous workspace.
      "super + shift + {Left,Right}" = "bspc desktop -f {prev,next}.local";

      # Go to specific workspace.
      "super + {1-9,0}" = "bspc desktop -f '^{1-9,10}'";

      # -- Preselect.
      # Preselect the direction.
      "super + ctrl + {Left,Down,Up,Right}" =
        "bspc node -p {west,south,north,east}";

      # Preselect the ratio.
      "super + ctrl + {1-9}" = "bspc node -o 0.{1-9}";

      # cancel the preselection for the focused node
      "super + ctrl + Escape" = "bspc node -p cancel";

      # -- Move/resize.
      # Resize.
      "super + shift + alt + {Left,Down,Up,Right}" =
        "bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}";

      # Move node.
      "super + shift + ctrl + {Left,Right}" =
        "bspc node --to-desktop {prev,next}";

      # Layout.
      "super + ctrl + alt + {Left,Right}" = "bsp-layout {previous,next}";

      # Tab layout.
      # Add focused window to a tabbed instance in given direction
      "super + t; {Left,Down,Up,Right}" =
        "~/.local/bin/tabc add $(bspc query -N -n focused) $(bspc query -N -n {west,south,north,east})";

      # Remove one tab from tabbed
      "super + t; r" = "tabc remove-child $(bspc query -N -n focused)";
    };
  };
}
