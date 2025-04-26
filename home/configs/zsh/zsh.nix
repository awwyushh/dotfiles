{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "eza --icons";
      ll = "eza -la --icons";
      update = "home-manager switch --flake ~/dotfiles#ayush";
      rebuild = "sudo nixos-rebuild switch --flake ~/dotfiles#ayush";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "z"
        "sudo"
        "colored-man-pages"
        "command-not-found"
        "fzf"
      ];
      # custom = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k"; # <-- Important to point to the correct theme
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./p10k-config;
        file = "p10k.zsh";
      }
    ];

    initContent = ''
      bindkey "\eh" backward-word
      bindkey "\ej" down-line-or-history
      bindkey "\ek" up-line-or-history
      bindkey "\el" forward-word
    '';


        initExtra = ''
      export EDITOR=nvim
      export PATH=$HOME/.local/bin:$PATH

      # Avoid terminal freezing on Ctrl+S
      stty -ixon

      # zoxide setup
      eval "$(zoxide init zsh)"

      # fzf keybindings
      eval "$(fzf --zsh)"

      # Show system info on terminal start
      neofetch

      # Powerlevel10k instant prompt (optional, super fast)
      if [[ -r "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/p10k.zsh" ]]; then
        source "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/p10k.zsh"
      fi
    '';

  };

  home.packages = with pkgs; [
    zsh-powerlevel10k
    zoxide
    fzf
    eza
    starship
    neofetch
  ];
}
