final: prev: {
  x1e80100-linux = final.callPackage ./x1e80100-linux.nix { };
  x1e80100-asus-vivobook-s15-firmware = final.callPackage ./x1e80100-asus-vivobook-s15-firmware.nix { };
  x1e80100-asus-vivobook-s15-firmware-json = final.callPackage ./x1e80100-asus-vivobook-s15-firmware-json.nix { };
  libqrtr = final.callPackage ./libqrtr.nix { };
  pd-mapper = final.callPackage ./pd-mapper.nix { };
}
