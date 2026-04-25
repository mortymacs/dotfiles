# Custom packages built from GitHub sources that have no flake.nix or shell.nix.
# Add each package as an attribute; it becomes available as pkgs.myPackageName.
#
# To get the hash values, run:
#   nurl https://github.com/owner/repo vTAG
#
# Language-specific builders:
#   C/C++  -> final.stdenv.mkDerivation { ... }
#   Go     -> final.buildGoModule { ... }
#   Rust   -> final.rustPlatform.buildRustPackage { ... }
#   Python -> final.python3Packages.buildPythonPackage { ... }
#
# Example (Go project):
#
#   my-go-tool = final.buildGoModule rec {
#     pname = "my-go-tool";
#     version = "1.2.3";
#     src = final.fetchFromGitHub {
#       owner  = "some-owner";
#       repo   = "my-go-tool";
#       rev    = "v${version}";
#       hash   = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
#     };
#     vendorHash = "sha256-BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB=";
#   };
#
# Example (C project with cmake):
#
#   my-c-tool = final.stdenv.mkDerivation rec {
#     pname = "my-c-tool";
#     version = "0.5.0";
#     src = final.fetchFromGitHub {
#       owner  = "some-owner";
#       repo   = "my-c-tool";
#       rev    = "v${version}";
#       hash   = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
#     };
#     nativeBuildInputs = [ final.cmake final.pkg-config ];
#     buildInputs       = [ final.openssl ];
#   };
final: prev: {
}
