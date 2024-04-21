{ fetchurl, stdenv, lib }:

stdenv.mkDerivation rec {
  pname = "jnv";
  version = "v0.2.2";

  src = fetchurl {
    # nix-prefetch-url --type sha256 https://github.com/ynqa/jnv/releases/download/v0.2.2/jnv-x86_64-unknown-linux-gnu.tar.xz
    sha256 = "0jnv9q1aacmgrx3i80d6g95kwflvz33ipfdpa87gm80mf7qnlzq8";
    url = "https://github.com/ynqa/jnv/releases/download/${version}/jnv-x86_64-unknown-linux-gnu.tar.xz";
  };

  installPhase = ''
    mkdir -p $out/bin
    tar xf $src -C $out/bin --strip-components=1
  '';
}
