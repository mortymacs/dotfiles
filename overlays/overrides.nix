# Override existing nixpkgs packages — change compile flags, enable/disable
# features, apply patches, swap dependencies, etc.
# The overridden package is still referenced by its original name everywhere.
#
# Two tools:
#
#   .override        — change inputs/options the package already exposes
#                      (look for `makeOverridable` in the package definition)
#
#   .overrideAttrs   — full control: patch the raw derivation attributes
#                      (configureFlags, buildInputs, patches, postInstall …)
#
# Example (.override — feature flags):
#
#   somePackage = prev.somePackage.override {
#     withFeatureX = true;
#     enableFoo    = false;
#   };
#
# Example (.overrideAttrs — custom compile flags + extra patch):
#
#   somePackage = prev.somePackage.overrideAttrs (old: {
#     configureFlags = (old.configureFlags or []) ++ [
#       "--enable-foo"
#       "--disable-bar"
#     ];
#     buildInputs = old.buildInputs ++ [ final.someLib ];
#     patches     = (old.patches or []) ++ [ ./patches/somePackage-fix.patch ];
#   });
final: prev: {
}
