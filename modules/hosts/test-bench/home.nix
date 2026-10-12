{ self, inputs, ... }: {

  # This is your standalone home-manager configuration, meant to be used on non-nixos machines
  # with the home-manager command
  # flake.homeConfigurations.ardi = inputs.home-manager.lib.homeManagerConfiguration {
  #   pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
  #   modules = [
  #     self.homeModules.ardiModule
  #     {
  #       home.username = "ardi";
  #       home.homeDirectory = "/home/ardi";
  #     }
  #   ];
  # };

  flake.homeModules.ardiModule = { pkgs, ... }: {

    home.packages = [ ];
    home.stateVersion = "26.05";
  };

}
