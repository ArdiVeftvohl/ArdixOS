{ self, inputs, ... }: {

  flake.nixosModules.testBenchConfiguration = { pkgs, lib, ... }: {
    imports = [
      self.nixosModules.testBenchHardware
      self.nixosModules.niri
      self.nixosModules.noctalia-greeter
    ];
  
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelPackages = pkgs.linuxPackages_latest;
  
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    networking = {
      hostName = "testbench";
      networkmanager.enable = true;
    };
  
    time.timeZone = "Europe/Amsterdam";
  
    users.users.ardi = {
      isNormalUser = true;
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
      packages = with pkgs; [
        tree
      ];
    };
  
    environment.systemPackages = with pkgs; [
      neovim
      wget
      curl
      git
      pciutils
    ];

    programs.firefox.enable = true;
  
    services = {
      openssh.enable = true;
      pipewire = {
        enable = true;
        pulse.enable = true;
      };
    };
  
    system.stateVersion = "26.05"; # Did you read the comment?
  };

}
