{ self, inputs, ... }: {

  flake.nixosModules.testBenchHardware = { config, lib, pkgs, modulesPath, ... }:{
    imports = [
      (modulesPath + "/profiles/qemu-guest.nix")
    ];

    boot.initrd.availableKernelModules = [ "xhci_pci" "ohci_pci" "ehci_pci" "virtio_pci" "ahci" "usbhid" "sr_mod" "virtio_blk" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-amd" ];
    boot.extraModulePackages = [ ];

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/e98f6a5b-bb6a-4d13-9cde-c57606cc60b4";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/81BD-FE66";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

    swapDevices = [
      { device = "/dev/disk/by-uuid/1295f8cd-9721-4a32-97c7-6f2ad260d40a"; }
    ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  };

}
