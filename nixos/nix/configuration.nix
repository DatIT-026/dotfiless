# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:


{
  imports =
    [ # Include the results of the hardware scan.
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

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "datto"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";

  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
    
  programs.niri.enable = true;
  programs.waybar.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  users.mutableUsers = false;
  users.users.datto = {
    isNormalUser = true;
    password = "datto";
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  nix.settings = {
    show-trace = true;
    auto-optimise-store = true;
    experimental-features = ["nix-command" "flakes"];
    flake-registry = "";
  };
 
  programs.firefox.enable = true;
  programs.nh.enable = true;

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;


  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs;[
    brightnessctl
    swaybg
    zsh
    rofi-wayland
    alacritty
    kitty
    yazi
    helix
    wget
    git
    rofi-wayland
  ];

  fonts.packages = with pkgs; [
    roboto
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.fira-code
    font-awesome
  ];

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
  system.stateVersion = "25.11"; # Did you read the comment?

}

