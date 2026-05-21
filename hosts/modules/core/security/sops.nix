{ config, inputs, ... }:
{
  sops = {
    defaultSopsFile = ../../../../secrets/desktop.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/duckdarsh/.config/sops/age/keys.txt";
    secrets."duckdarsh-password" = {
      neededForUsers = true;
    };
  };
}
