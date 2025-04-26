{ config, pkgs, ... }:

{

programs.vscode.enable = true;
  # Install VSCode extensions


programs.vscode.profiles.default.extensions = with pkgs.vscode-extensions; [
    ms-vscode.cpptools              # Microsoft C++ IntelliSense
    ms-vscode.cmake-tools            # CMake integration
    ms-vscode.cpptools-extension-pack # Extra C++ tools
    ms-azuretools.vscode-docker       # (Optional) if you want docker
    ms-python.python                  # Python extension (for scripts)
    vadimcn.vscode-lldb                # Better debugger (LLDB)
    formulahendry.code-runner          # Fast run buttons
    editorconfig.editorconfig          # Consistent coding styles
  ];

  # VSCode user settings
programs.vscode.profiles.default.userSettings = {
    "editor.tabSize" = 4;
    "editor.detectIndentation" = false;
    "editor.formatOnSave" = true;
    "editor.wordWrap" = "on";
    "files.autoSave" = "afterDelay";
    "workbench.colorTheme" = "Default Dark+";
    "terminal.integrated.defaultProfile.linux" = "zsh";

    "C_Cpp.intelliSenseEngine" = "Default";
    "C_Cpp.default.compilerPath" = "/run/current-system/sw/bin/g++";
    "C_Cpp.default.cppStandard" = "c++20";

    "code-runner.executorMap" = {
      "cpp" = "g++ -std=c++20 -O2 -Wall $fileName -o $fileNameWithoutExt && time ./$fileNameWithoutExt";
    };
    "code-runner.runInTerminal" = true;
    "terminal.integrated.fontFamily" = "FiraCode Nerd Font";
  };
}
