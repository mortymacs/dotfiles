# Edit this configuration file to define what should be installed on your system.
{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  # Nix.
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Bootloader.
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 5;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
  };

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-175a4d67-da09-48ae-ad74-70a2042273ab".device = "/dev/disk/by-uuid/luks-175a4d67-da09-48ae-ad74-70a2042273ab";
  boot.initrd.luks.devices."luks-175a4d67-da09-48ae-ad74-70a2042273ab".keyFile = "/crypto_keyfile.bin";

  # Networking.
  networking = {
    hostName = "fx";
    networkmanager = {
      enable = true;
    };
  };

  # Time zone.
  time.timeZone = "Europe/Amsterdam";

  # Internationalisation.
  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  # Xserver.
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    synaptics.enable = true;
    displayManager = {
      lightdm = {
        enable = true;
      };
      defaultSession = "none+bspwm";
    };
    windowManager = {
      bspwm = {
        enable = true;
      };
    };
  };

  # Printer.
  services.printing.enable = true;

  # Sound.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # User.
  users.users.mort = {
    isNormalUser = true;
    description = "mort";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    initialPassword = "password";
    shell = pkgs.zsh;
    packages = [
        bsp-layout
        bc
    ];
  };

  # Package setting.
  nixpkgs.config.allowUnfree = true;

  # Global packages.
  environment.systemPackages = with pkgs; [
    nano
    wget
    home-manager
  ];

  # Virtualization.
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };

  # Misc.
  services.greenclip.enable = true;

  # Security.
  services.tor = {
      enable = true;
      client.enable = true;
  };
  services.privoxy = {
    enable = true;
    enableTor = true;
  };

  # Font.
  fonts = {
    fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "CodeNewRoman" ]; })
      vazir-fonts
      lexend
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "lexend" "Vazir" ];
        sansSerif = [ "lexend" "Vazir" ];
        monospace = [ "Ellograph CF Neovim Test 2" "Code New Roman Nerd Font" ];
      };
    };
  };

  # Enable dconf.
  programs.dconf.enable = true;

  # NixOS release.
  system.stateVersion = "22.11";
}
