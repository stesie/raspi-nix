{ pkgs, ... }:
{

  services.printing = {
    enable = true;

    browsing = true;
    defaultShared = true;
    listenAddresses = [ "*:631" ];

    drivers = with pkgs; [ hplip ];

    extraConf = ''
        <Location />
          Order allow,deny
          Allow localhost
          Allow @LOCAL
        </Location>

        <Policy default>
          <Limit Hold-Job Release-Job Restart-Job Purge-Jobs Set-Job-Attributes Create-Job-Subscription Renew-Subscription Cancel-Subscription Get-Notifications Reprocess-Job Cancel-Current-Job Suspend-Current-Job Resume-Job CUPS-Move-Job>
            Require user @OWNER @SYSTEM
            Order deny,allow
          </Limit>

          <Limit Pause-Printer Resume-Printer Set-Printer-Attributes Enable-Printer Disable-Printer Pause-Printer-After-Current-Job Hold-New-Jobs Release-Held-New-Jobs Deactivate-Printer Activate-Printer Restart-Printer Shutdown-Printer Startup-Printer Promote-Job Schedule-Job-After CUPS-Add-Printer CUPS-Delete-Printer CUPS-Add-Class CUPS-Delete-Class CUPS-Accept-Jobs CUPS-Reject-Jobs CUPS-Set-Default>
            AuthType Basic
            Require user @SYSTEM
            Order deny,allow
          </Limit>

          <Limit Cancel-Job CUPS-Authenticate-Job>
            Require user @OWNER @SYSTEM
            Order deny,allow
          </Limit>

          <Limit All>
            Order deny,allow
          </Limit>
        </Policy>
      '';
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
