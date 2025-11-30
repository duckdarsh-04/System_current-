{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    bashrcExtra =''
      # Enable bash-git-prompt
      GIT_PROMPT_ONLY_IN_REPO=1
      source ~/.bash-git-prompt/gitprompt.sh
      # Load bash-preexec
      source ${pkgs.bash-preexec}/share/bash/bash-preexec.sh
      # Atuin
      eval "$(atuin init bash)"
      # Custom functions
      if [ -f ~/func ]; then
        source ~/func
      fi 
    '';

   shellAliases = {
     ll = "ls -lah";
     gs = "git status";
     btop = "btop --force-utf";
     rb="nh os switch"; 
     ls="eza --icons --group-directories-first";
     nv="sudo nvim";
   };         
  };

  home.packages = with pkgs; [
    neofetch
    bash-preexec
  ];

}
