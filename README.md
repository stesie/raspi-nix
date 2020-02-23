# raspi-nix

This is mostly configuration of my personal Raspberry Pi, which I happen to do
using NixOS.  So if you're also interested in running NixOS on your Raspberry,
start looking around starting at `sd-image-homepi.nix`.

There's one file `secrets.nix` which includes Wifi credentials and password
hashes and hence are a) likely not of interest anyways and b) private.

I'm running this on a Raspberry Pi 3B+

To build the SD image, simply run `nix-build` like so:

```
nix-build '<nixpkgs/nixos>' -A config.system.build.sdImage --argstr system aarch64-linux -I nixos-config=./sd-image-homepi.nix  -I nixpkgs=https://releases.nixos.org/nixos/20.03/nixos-20.03beta-475.71be729a58e/nixexprs.tar.xz -o result-homepi
```

Of course your local machine needs to be able to compile/run `aarch64-linux` binaries.

If you happen to see `Cannot allocate memory` error messages emitted by `cptofs`,
simply ignore them.  It seems to do its job just fine anyways.

PS: make sure to use NixOS 20.03 (or later); former versions like 19.09 seem to
cause trouble (at least it does not successfully run the system activation script
on first boot).
