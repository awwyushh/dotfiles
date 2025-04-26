{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;

    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "ls --color=auto";
      ll = "ls -la";
      update = "home-manager switch --flake ~/dotfiles#ayush";
      rebuild = "sudo nixos-rebuild switch --flake ~/dotfiles#ayush";
    };

    oh-my-zsh = {
      enable = true;
      theme = "agnoster"; # Can be "powerlevel10k" later if you want EVEN better look.
      plugins = [ "git" "z" "sudo" "colored-man-pages" "command-not-found" ];
    };

    initExtra = ''
      # Set up better prompt
      export EDITOR=nvim
      export PATH=$HOME/.local/bin:$PATH

      # Less annoying Ctrl+S freeze
      stty -ixon

      # Nice greeting
      echo "Welcome back, Ayush! 🚀"

      # fast-syntax-highlighting tweaks
      ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

      # zoxide setup (optional: better cd)
      eval "$(zoxide init zsh)"
    '';
  };

  home.packages = with pkgs; [
    zoxide   # better 'cd'
    fzf      # fuzzy finder
    eza      # modern 'ls'
    starship # optional: better prompt engine
  ];
}
