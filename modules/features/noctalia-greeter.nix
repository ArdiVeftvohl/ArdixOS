{ self, inputs, ... }: {
  flake.nixosModules.noctalia-greeter = { pkgs, lib, ... }: {
    services.displayManager.noctalia-greeter = {
      enable = false;
      settings = {
        cursor.size = 24;
        keyboard.layout = "us";
      };
    };
  };
}
