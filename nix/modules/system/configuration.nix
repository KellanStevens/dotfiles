{ pkgs, config, lib, ... }:

{
  system.defaults = {
    dock = {
      autohide = true; # autohide dock
      autohide-delay = 0.0; # remove autohide delay
      mru-spaces = false; # disable most recent used spaces
    };

    finder = {
      _FXShowPosixPathInTitle = true;  # show full path in finder title
      AppleShowAllExtensions = true;  # show all file extensions
      FXEnableExtensionChangeWarning = false;  # disable warning when changing file extension
      QuitMenuItem = true;  # enable quit menu item
      ShowPathbar = true;  # show path bar
    };

    trackpad = {
      Clicking = true;  # enable tap to click
      TrackpadRightClick = true;  # enable two finger right click
      TrackpadThreeFingerDrag = true;  # enable three finger drag
    };

    NSGlobalDomain = {
      "com.apple.swipescrolldirection" = true;  # enable natural scrolling(default to true)
      AppleICUForce24HourTime = true;  # use 24-hour time
      AppleInterfaceStyle = "Dark";  # use dark mode
      AppleShowScrollBars = "WhenScrolling";  # show scroll bars only when scrolling
    };

    CustomUserPreferences = {
      "com.apple.finder" = {
        ShowExternalHardDrivesOnDesktop = true;
        ShowHardDrivesOnDesktop = true;
        ShowMountedServersOnDesktop = true;
        ShowRemovableMediaOnDesktop = true;
        _FXSortFoldersFirst = true;
        # When performing a search, search the current folder by default
        FXDefaultSearchScope = "SCcf";
      };

      "com.apple.Dock" = {
        wvous-tl-modifier = 131072; # shift as modifier key
        wvous-tl-corner = 10; # top left hot corner
      };

      "com.apple.desktopservices" = {
        # Avoid creating .DS_Store files on network or USB volumes
        DSDontWriteNetworkStores = true;
        DSDontWriteUSBStores = true;
      };

      "com.apple.screencapture" = {
        location = "~/Desktop/Screenshots";
        type = "png";
      };

      loginwindow = {
        GuestEnabled = false;  # disable guest user
        SHOWFULLNAME = true;  # show full name in login window
      };
    };
  };

  security.pam.services.sudo_local.touchIdAuth = true;
}
