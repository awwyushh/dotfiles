{ config, pkgs, ...}:

{
    home.username = "ayush";
    home.homeDirectory = "/home/ayush";

    home.stateVersion = "24.11";

    home.packages = with pkgs; [
        neovim
        firefox
        google-chrome
        vscode

        gcc
        gdb
        ninja
        gnumake

        ripgrep
        fd
        bat
        zoxide
        unzip

	gh
    ];

    programs.git = {
        enable = true;
        userName = "awwyushh";
        userEmail = "awwwyushh@gmail.com";
    };

    imports = [
        ./configs/vscode.nix
        ./configs/zsh.nix
    ];
}
