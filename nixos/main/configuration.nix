# Edit this configuration file to define what should be installed on your system.
{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../common/ld.nix
    ../common/fwupd.nix
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
      configurationLimit = 10;
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
  boot.initrd.luks.devices = {
    "luks-175a4d67-da09-48ae-ad74-70a2042273ab".device = "/dev/disk/by-uuid/175a4d67-da09-48ae-ad74-70a2042273ab";
    "luks-175a4d67-da09-48ae-ad74-70a2042273ab".keyFile = "/crypto_keyfile.bin";
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;

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
        background = "#060606";
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
    description = "Mort";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    initialPassword = "password";
    shell = pkgs.zsh;
    packages = with pkgs; [
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
    ntfs3g
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
