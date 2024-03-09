{ config, pkgs, inputs, ... }:
let defaultPackages = import ../common/packages.nix { inherit pkgs; };
in {
  imports = [
    ./hardware-configuration.nix
    ../common/ld.nix
    ../common/fwupd.nix
    ../common/font.nix
    ../common/misc.nix
    ../common/excludes.nix
  ];

  # Nix.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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
  boot.initrd.secrets = { "/crypto_keyfile.bin" = null; };

  # Kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Networking.
  networking = {
    hostName = "fx";
    networkmanager = { enable = true; };
  };

  # Time zone.
  time.timeZone = "Europe/Amsterdam";

  # Internationalisation.
  i18n = { defaultLocale = "en_US.UTF-8"; };

  # Xserver.
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    displayManager = {
      lightdm = {
        enable = true;
        background = "#060606";
      };
      defaultSession = "none+bspwm";
    };
    windowManager = { bspwm = { enable = true; }; };
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
    shell = pkgs.fish;
    packages = with pkgs; [ bc ];
  };

  # Config packages.
  nixpkgs = {
    config = { allowUnfree = true; };
    overlays = [
      (final: prev: {
        unstable = import inputs.nixpkgs-unstable {
          system = final.system;
          config.allowUnfree = true;
        };
      })
    ];
  };

  # Global packages.
  environment.systemPackages = with pkgs; defaultPackages.list ++ [ ];

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

  # Enable Fish.
  programs.fish.enable = true;

  # Enable dconf.
  programs.dconf.enable = true;

  # NixOS installed version.
  system.stateVersion = "22.11";
}
