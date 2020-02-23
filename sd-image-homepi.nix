# To build, use:
# nix-build '<nixpkgs/nixos>' -A config.system.build.sdImage --argstr system aarch64-linux -I nixos-config=./sd-image-homepi.nix  -I nixpkgs=https://releases.nixos.org/nixos/20.03/nixos-20.03beta-475.71be729a58e/nixexprs.tar.xz -o result-homepi
{ pkgs, ... }:
{
  imports = [
    ./raspi-base.nix
    ./common-config.nix
    ./cups-server
  ];

  networking.hostName = "homepi";

  networking.firewall = {
    enable = true;

    allowedUDPPorts = [ 631 ];
    allowedTCPPorts = [ 22 631 ];
  };

  services.avahi = {
    enable = true;

    publish = {
      enable = true;
      userServices = true;
    };
  };

}
