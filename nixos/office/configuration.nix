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
    inputs.atkrad.nixosModules.cato-client
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

  # Kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "i915.force_probe=22e8" ];

  # Time zone.
  time.timeZone = "Europe/Amsterdam";

  # Internationalisation.
  i18n = {
    defaultLocale = "en_US.UTF-8";
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
    pulse.enable = true;
  };

  # Bluetooth.
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # User.
  users.users.mort = {
    isNormalUser = true;
    description = "Mort";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
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

  # Virtualization.
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };

  # Security.
  services.tor = {
    enable = true;
    client.enable = true;
  };
  services.privoxy = {
    enable = true;
    enableTor = true;
  };
  services.cato-client = {
    enable = true;
    package = inputs.atkrad.packages.x86_64-linux.cato-client;
  };

  # Enable Fish.
  programs.fish.enable = true;

  # Enable dconf.
  programs.dconf.enable = true;

  # Boost.
  services.thinkfan = {
    enable = true;
    smartSupport = true;
  };

  # NixOS installed version.
  system.stateVersion = "22.11";
}
