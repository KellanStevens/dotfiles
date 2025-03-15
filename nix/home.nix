# home.nix

{ config, pkgs, ... }:

{
    # TODO: faze out home-manager
    programs.home-manager.enable = true;
    home = {
        stateVersion = "24.11";
        sessionVariables = {
            EDITOR = "nvim";
        };
    };
}
