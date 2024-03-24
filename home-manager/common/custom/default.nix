{ fetchurl, stdenv, lib }:

stdenv.mkDerivation rec {
    pname = "jnv";
    version = "v0.1.3";

    src = fetchurl {
        sha256 = "1b4h2nmqaa8i64h15in074kivp2bvyrlz03zw1dsl7lbc649f87a";
        url = "https://github.com/ynqa/jnv/releases/download/${version}/jnv-x86_64-unknown-linux-gnu.tar.xz";
    };

    installPhase = ''
        mkdir -p $out/bin
        tar xf $src -C $out/bin --strip-components=1
    '';
}
