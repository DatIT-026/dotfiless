# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, pkgs, ... }:

{  
  imports = [
    ./stylix.nix
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-partlabel/nix";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-partlabel/ESP";
    };
  };

  stylix = {
    enable = true;
    image = null;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  };

  services.thermald = {
    enable = true;
  };

  services.tlp = {
    enable = true;
    settings = {
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
    };
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "datto";
    networkmanager.enable = false; # Easiest to use and most distros use this by default.
    wireless.iwd.enable = true;
    networkmanager.wifi.backend = "iwd";
  };

  systemd.targets = {
    sleep.enable = false;
    suspend.enable = false;
    hibernate.enable = false;
    hybrid-sleep.enable = false;
  };

  # Set your time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";
  time.hardwareClockInLocalTime = true;

  services = {
    displayManager.gdm.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  programs.niri.enable = true;
  programs.waybar.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # command: fcitx5-configtool
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-bamboo
      fcitx5-gtk
    ];
  };

  environment.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    SDL_IM_MODULE = "fcitx";

    NIXOS_OZONE_WL = "1";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    QT_QPA_PLATFORM = "wayland";
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  users.mutableUsers = false;
  users.users.datto = {
    isNormalUser = true;
    password = "datto";
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user
  };

  home-manager.users.datto =
    { ... }:
    {
      imports = [ ./datto.nix ];
    };

  nix.settings = {
    show-trace = false;
    auto-optimise-store = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    flake-registry = "";
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  programs.firefox.enable = true;
  programs.nh.enable = true;

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
 
  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    brightnessctl
    pwvucontrol
    swaybg
    rofi-wayland
    alacritty
    xorg.setxkbmap
    kitty
    yazi
    helix
    wget

    nil
    alejandra

    libreoffice
    git
    gcc

    jetbrains.idea-community
    jdk8
    xwayland-satellite
  ];
 
  fonts.packages = with pkgs; [
    roboto
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    font-awesome

    ipafont
  ];

  services.dbus.enable = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment? yes
}
