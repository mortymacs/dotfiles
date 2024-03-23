{ fetchurl, stdenv, lib }:

stdenv.mkDerivation rec {
    pname = "jnv";
    version = "v0.1.2";

    src = fetchurl {
        sha256 = "1mj3fzqim9lzq53mfqpfmql08wgc2fan2mqdnwwb8pylif6a30fj";
        url = "https://github.com/ynqa/jnv/releases/download/${version}/jnv-x86_64-unknown-linux-gnu.tar.xz";
    };

    installPhase = ''
        mkdir -p $out/bin
        tar xf $src -C $out/bin --strip-components=1
    '';
}
