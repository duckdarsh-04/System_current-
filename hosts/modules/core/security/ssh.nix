{ pkgs, config, ... }:
{
  # sshguard
  services.sshguard.enable = true;
  # config_options_sshguard
  services.sshguard.attack_threshold = 5;
  services.sshguard.blocktime = 900;
  services.sshguard.detection_time = 30;
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "no";
  services.openssh.settings.PasswordAuthentication = false;
  services.openssh.settings.ChallengeResponseAuthentication = false;
  services.openssh.settings.KbdInteractiveAuthentication = false;
}
