{ config, pkgs, ...}:

{
    home.username = "ayush";
    home.homeDirectory = "/home/ayush";

    home.stateVersion = "24.11";

    programs.zsh.enable = true;

    home.packages = with pkgs; [
        neovim
        firefox
        google-chrome
        vscode

        clang
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
    ];
}
