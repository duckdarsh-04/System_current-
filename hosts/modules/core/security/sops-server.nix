{ config, ... }:
{
  sops = {
    defaultSopsFile = ../../../../secrets/server.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/duckdarsh/.config/sops/age/keys.txt";
    secrets."duckdarsh-password" = {
      neededForUsers = true;
    };
  };
}
