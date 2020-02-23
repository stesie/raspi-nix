{ ... }:
let
  inherit (import ./secrets.nix) rootPasswordHash sshAuthorizedKeys wifiNetworks;
in {
  users.users.root.initialHashedPassword = rootPasswordHash;
  users.extraUsers.root.openssh.authorizedKeys.keys = sshAuthorizedKeys;

  networking.wireless = {
    enable = true;
    networks = wifiNetworks;
  };

  time.timeZone = "Europe/Berlin";
}

