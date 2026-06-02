{ pkgs, config, ... }:
{

  # Docker virtualisation enabled
  virtualisation.docker.enable = true;
  virtualisation.docker.storageDriver = "overlay2";
  virtualisation.oci-containers.backend = "docker";
}
