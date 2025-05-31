{
  description = "Kellan's Darwin flake";

  inputs = {
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:LnL7/nix-darwin";
    };
  };

  outputs = inputs@{ self, darwin, nixpkgs, nix-homebrew }:
  let
    configuration = { pkgs, config, ... }: {
      # Import Homebrew & System configuration
      imports = [ ./modules/apps/configuration.nix ./modules/system/configuration.nix ];

      fonts.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
        nerd-fonts.hack
        nerd-fonts.iosevka
      ];

      users.users.kellan = {
        home = "/Users/kellan";
      };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";
      nix.extraOptions = ''warn-dirty = false'';

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      system.activationScripts.homebrew-linking.text = ''
          brew link --overwrite php@8.1
          brew link --overwrite python@3.9
      '';

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake ~/.config/nix#macbook-pro
    darwinConfigurations."macbook-pro" = darwin.lib.darwinSystem {
      modules = [
        configuration
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "kellan";
            autoMigrate = true;
          };
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."macbook-pro".pkgs;
  };
}
