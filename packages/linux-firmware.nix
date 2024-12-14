{
  lib,
  stdenv,
  fetchurl,
}:

stdenv.mkDerivation {
  pname = "linux-firmware";
  version = "20241210";

  src = fetchurl {
    url = "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/snapshot/linux-firmware-${version}.tar.gz";
    sha256 = "sha256-9KVvSRKXg1AYZlQpGO+F6TzQbS8wM6TIFPVNS9FjPGE=";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/lib/firmware
    cp -r * $out/lib/firmware

    # Remove documentation and license files
    rm -f $out/lib/firmware/{WHENCE,LICENCE*,LICENSE*,README*}

    runHook postInstall
  '';
}
