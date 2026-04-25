# Entry point: returns the list of overlays applied to every profile.
# Import order matters — unstable is first so custom/overrides can reference it.
inputs: [
  (import ./unstable.nix inputs)
  (import ./custom.nix)
  (import ./overrides.nix)
]
