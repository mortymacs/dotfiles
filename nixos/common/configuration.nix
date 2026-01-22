{ lib, pkgs, ... }:
{
  # Nix.
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Bootloader.
  boot = {
    plymouth = {
      enable = true;
    };
    initrd.systemd.enable = true;
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };
    kernelParams = [
      "quiet"
      "splash"
    ];
  };

  # Console.
  console = {
    earlySetup = true;
    useXkbConfig = true;
    font = "sun12x22";
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
    alsa.support32Bit = true;
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
      intel-vaapi-driver
      libva-vdpau-driver
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

  # Security.
  security.rtkit.enable = true;

  # Enable Fish.
  programs.fish.enable = true;

  # Gnupg.
  programs.gnupg.agent.enable = true;
}
