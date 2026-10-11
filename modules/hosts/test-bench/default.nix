{ self, inputs, ...}: {

  flake.nixosConfigurations.testBench = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.testBenchConfiguration
    ];
  };

}
