{ fetchurl, stdenv, lib }:

stdenv.mkDerivation rec {
    pname = "jnv";
    version = "v0.2.0";

    src = fetchurl {
        sha256 = "1z9i9hq297w20a7985q6jy6k9rkaj3imy19n0c1hykiia3asfk4z";
        url = "https://github.com/ynqa/jnv/releases/download/${version}/jnv-x86_64-unknown-linux-gnu.tar.xz";
    };

    installPhase = ''
        mkdir -p $out/bin
        tar xf $src -C $out/bin --strip-components=1
    '';
}
