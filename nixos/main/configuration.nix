{ pkgs, inputs, ... }:
let
  defaultPackages = import ../common/packages.nix { inherit pkgs; };
in
{
  imports = [
    ./hardware-configuration.nix
    ../common/network.nix
    ../common/ld.nix
    ../common/fwupd.nix
    ../common/font.nix
    ../common/misc.nix
    ../common/excludes.nix
    ../common/wm.nix
    ../common/virtualisation.nix
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
    };
  };

  # Time zone.
  time.timeZone = "Europe/Amsterdam";

  # Internationalisation.
  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  # Printer.
  services.printing.enable = false;

  # Sound.
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Bluetooth.
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Graphic.
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
      intel-media-driver
      libGL
      libGLU
    ];
  };
  services.xserver.videoDrivers = [ "intel" ];

  # User.
  users.users.mort = {
    isNormalUser = true;
    description = "Mort";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
    ];
    initialPassword = "password";
    shell = pkgs.fish;
    packages = with pkgs; [ ];
  };

  # Config packages.
  nixpkgs = {
    overlays = [
      (final: prev: { unstable = import inputs.nixpkgs-unstable { system = final.system; }; })
    ];
  };

  # Global packages.
  environment.systemPackages = with pkgs; defaultPackages.list ++ [ ];

  # Security.
  security.rtkit.enable = true;
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

  # NixOS installed version.
  system.stateVersion = "24.11";
}
