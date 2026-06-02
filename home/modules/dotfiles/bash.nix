{
  config,
  pkgs,
  ...
}:
{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      # Enable bash-git-prompt
      GIT_PROMPT_ONLY_IN_REPO=1
      source ${pkgs.bash-git-prompt}/gitprompt.sh
      # Load bash-preexec
      source ${pkgs.bash-preexec}/share/bash/bash-preexec.sh
      # Atuin
      eval "$(atuin init bash)"
      #neofetch
      if [[ $- == *i* ]] && [[ ! -f /tmp/neofetch-shown-$USER ]]; then
        touch /tmp/neofetch-shown-$USER
        neofetch
      fi
    '';

    shellAliases = {
      ll = "ls -lah";
      gs = "git status";
      btop = "btop --force-utf";
      rb = "nh os switch";
      ls = "eza --icons --group-directories-first";
      nv = "sudo nvim";
    };
  };

  home.packages = with pkgs; [
    neofetch
    bash-preexec
    bash-git-prompt
  ];
}
