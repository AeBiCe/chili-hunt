{ pkgs, lib, config, inputs, ... }:

{
  env.GREET = "Chili Hunt Development 🌶️";

  # https://devenv.sh/packages/
  packages = [ pkgs.love ];

  # Enable Lua
  languages.lua.enable = true;

  # https://devenv.sh/scripts/
  scripts.hello.exec = ''
    echo $GREET
  '';

  enterShell = ''
    hello
    git --version
  '';

}
