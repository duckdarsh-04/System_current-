{ config, inputs, ... }:
{
  sops = {
    defaultSopsFile = ../../../../secrets/desktop.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/duckdarsh/.config/sops/age/keys.txt";
    secrets."duckdarsh-password" = {
      neededForUsers = true;
    };
    secrets."ssh-private-key" = {
      owner = "duckdarsh";
      path = "/home/duckdarsh/.ssh/id_ed25519";
      mode = "0600";
    };
    secrets."cache-priv-key" = {
      owner = "root";
      path = "/run/secrets/cache-priv-key";
      mode = "0400";
    };
  };
}
