# Adds pkgs.unstable as an overlay so every profile can access
# bleeding-edge packages without switching the whole system channel.
#
# Usage: pkgs.unstable.somePackage
inputs: final: prev: {
  unstable = import inputs.nixpkgs-unstable {
    localSystem = final.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
}
