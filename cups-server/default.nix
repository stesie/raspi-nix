{ pkgs, ... }:
{

  services.printing = {
    enable = true;

    browsing = true;
    defaultShared = true;
    listenAddresses = [ "*:631" ];

    drivers = with pkgs; [ hplip ];
  };

  hardware.printers.ensurePrinters = [
    {
      name = "LaserJetPRO_M102a";
      location = "Arbeitszimmer";
      deviceUri = "usb://HP/LaserJet%20M101-M106?serial=VNC4D76446";
      model = "HP/hp-laserjet_m101-m106.ppd.gz";
      ppdOptions = {
        PageSize = "A4";
      };
    }
  ];

}
