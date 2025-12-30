{ pkgs, config, ... }:
{
  services.fail2ban.enable = true;
  services.fail2ban.bantime = "24h";
  services.fail2ban.bantime-increment.enable = true;
  services.fail2ban.bantime-increment.multipliers = "4";
  services.fail2ban.ignoreIP = [
    "100.110.171.14"
    "100.78.71.24"
    "192.168.0.121"
    "192.168.0.123"
  ];
  services.fail2ban.maxretry = 2;
}
