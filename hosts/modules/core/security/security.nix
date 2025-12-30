{
  pkgs,
  config,
  ...
}:
{
  security.apparmor.enable = true;
  security.apparmor.packages = [
    pkgs.apparmor-profiles
    pkgs.apparmor-utils
  ];
}
