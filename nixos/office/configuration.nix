# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
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
  boot.initrd.luks.devices = {
      "luks-dc6bb68a-06f0-4011-a2e9-b646b87c2251".device = "/dev/disk/by-uuid/dc6bb68a-06f0-4011-a2e9-b646b87c2251";
      "luks-dc6bb68a-06f0-4011-a2e9-b646b87c2251".keyFile = "/crypto_keyfile.bin";
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "i915.force_probe=22e8" ];

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

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mort = {
    isNormalUser = true;
    description = "Mort";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      bsp-layout
      bc
    ];
  };

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    nano
    wget
    home-manager
    ntfs3g
  ];

  # Package setting.
  nixpkgs.config.allowUnfree = true;

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
        monospace = [ "Code New Roman Nerd Font" ];
      };
    };
  };

  # Enable dconf.
  programs.dconf.enable = true;

  system.stateVersion = "22.11";
}
