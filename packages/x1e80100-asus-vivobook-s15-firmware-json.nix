{ runCommand }:

runCommand "x1e80100-asus-vivobook-s15-firmware-json"
  {
    # The userspace pd-mapper daemon cannot handle zstd compressed firmware, so
    # let's just disable compression for these files.
    passthru.compressFirmware = false;
  }
  ''
    mkdir -p $out/lib/firmware/qcom/x1e80100/ASUSTeK/vivobook-s15
    cp ${../firmware}/*.jsn \
      $out/lib/firmware/qcom/x1e80100/ASUSTeK/vivobook-s15/
  ''
