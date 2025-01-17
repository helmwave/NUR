# This file was generated by GoReleaser. DO NOT EDIT.
# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{
system ? builtins.currentSystem
, lib
, fetchurl
, installShellFiles
, stdenvNoCC
}:
let
  shaMap = {
    x86_64-linux = "0000000000000000000000000000000000000000000000000000";
    aarch64-linux = "0000000000000000000000000000000000000000000000000000";
    x86_64-darwin = "0000000000000000000000000000000000000000000000000000";
    aarch64-darwin = "0000000000000000000000000000000000000000000000000000";
  };

  urlMap = {
    x86_64-linux = "https://github.com/helmwave/helmwave/releases/download/v0.41.5/helmwave_0.41.5_linux_amd64.tar.gz";
    aarch64-linux = "https://github.com/helmwave/helmwave/releases/download/v0.41.5/helmwave_0.41.5_linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/helmwave/helmwave/releases/download/v0.41.5/helmwave_0.41.5_darwin_amd64.tar.gz";
    aarch64-darwin = "https://github.com/helmwave/helmwave/releases/download/v0.41.5/helmwave_0.41.5_darwin_arm64.tar.gz";
  };
in
stdenvNoCC.mkDerivation {
  pname = "helmwave";
  version = "0.41.5";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = ".";

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./helmwave $out/bin/helmwave
  '';

  system = system;

  meta = {
    description = "Helmwave is true release management for helm";
    homepage = "https://helmwave.app/";
    license = lib.licenses.mit;

    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];

    platforms = [
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
}
