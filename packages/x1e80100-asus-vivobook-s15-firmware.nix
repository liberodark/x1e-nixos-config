{
  fetchFromGitHub,
  fetchurl,
  runCommand,
}:

let
  # I verified manually that the following files match the SHA256 hashes of ones from my Windows install:
  # 9d02e51135f52e18efebe5f22bd3e35755b20d9f486185c9f43e870b71cb2739  qcom/x1e80100/ASUSTeK/vivobook-s15/adsp_dtbs.elf
  # d4b30215d91b2067811a9ebaf89861e4b6b9c5b10406f64bb29a11b5980c6248  qcom/x1e80100/ASUSTeK/vivobook-s15/cdsp_dtbs.elf
  # ccdb0191eec4951ef2dd483cbdc46d5686ef4e2c79a91631360bffa2473b8d86  qcom/x1e80100/ASUSTeK/vivobook-s15/qcadsp8380.mbn
  # 4264693ec87e005f0b980b8462c1f540bfbc329b0dc48d705040ab9914f6b232  qcom/x1e80100/ASUSTeK/vivobook-s15/qccdsp8380.mbn
  # 17e85d8496e4af4e2b7eac59f46d2bd8ed992aaf917f3ac2c4131703bcc45ad1  qcom/x1e80100/ASUSTeK/vivobook-s15/qcdxkmsuc8380.mbn
  firmware = fetchFromGitHub {
    owner = "anonymix007";
    repo = "x1e-firmware";
    rev = "6052736e4b8e957101830518540db9416f073840";
    hash = "sha256-l/wad7cAx5ouFOjvIsVUOq24vvXgfsXfdXuIoyExjaE=";
  };
in
runCommand "x1e80100-asus-vivobook-s15-firmware" { } ''
  mkdir -p $out/lib/firmware/qcom/x1e80100/ASUSTeK/vivobook-s15
  cp ${firmware}/firmware/qcom/x1e80100/ASUSTeK/vivobook-s15/{adsp_dtbs.elf,cdsp_dtbs.elf,qcadsp8380.mbn,qccdsp8380.mbn,qcdxkmsuc8380.mbn} \
    $out/lib/firmware/qcom/x1e80100/ASUSTeK/vivobook-s15/
''
