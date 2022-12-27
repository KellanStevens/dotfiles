#!/bin/bash

# Create an empty file called ".hushlogin" in the user's home directory to suppress the login banner message
touch ~/.hushlogin

# Set Dock to automatically hide when not in use
defaults write com.apple.dock "autohide" -bool "true"

# Set Dock to hide after a delay of 0.125 seconds (1/8th of a second)
defaults write com.apple.dock autohide-time-modifier -float 0.125

# Disable the "Recent Applications" section in the Dock
defaults write com.apple.dock "show-recents" -bool "false"

# Set default screenshot format to JPG
defaults write com.apple.screencapture type JPG

# Disable shadow effect on screenshots
defaults write com.apple.screencapture "disable-shadow" -bool "true"

# Create a new directory called "Screenshots" in the user's home directory
mkdir ~/Screenshots

# Set default screenshot save location to the "Screenshots" directory on the user's Desktop
defaults write com.apple.screencapture "location" -string "~/Desktop/Screenshots"

# Show hidden files in the Finder
defaults write com.apple.Finder "AppleShowAllFiles" -bool "true"

# Enable playback notifications in the Music app
defaults write com.apple.Music "userWantsPlaybackNotifications" -bool "true"

# Disable the press and hold feature, which allows a user to press and hold a key to access special characters
defaults write -g ApplePressAndHoldEnabled -bool false

# Set Dock to hide immediately
defaults write com.apple.dock autohide-time-modifier -float 0

# Set Dock to hide immediately
defaults write com.apple.dock autohide-delay -float 0

# Disable Time Machine's prompt to use new disks for backups
defaults write com.apple.TimeMachine "DoNotOfferNewDisksForBackup" -bool "true"

# Enable spring loading for all items in the Dock, which allows the user to access the contents of a folder by clicking and holding on it.
defaults write com.apple.dock "enable-spring-load-actions-on-all-items" -bool "true"

# Show file extensions in the Finder
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"

# Disable the Dock's ability to remember the most recently used spaces
defaults write com.apple.dock "mru-spaces" -bool "false"

# Reset the Dock to the default set of persistent (pinned) apps
defaults write com.apple.dock persistent-apps -array

# This command sets the number of rows on the Launchpad (the screen with app icons) to 5.
defaults write com.apple.dock springboard-rows -int 5

# This command sets the number of columns on the Launchpad (the screen with app icons) to 5.
defaults write com.apple.dock springboard-columns -int 9

# This command enables the Path bar in Finder
defaults write com.apple.finder "ShowPathbar" -bool "true"

# This command enables the display of hard drives on the desktop in Finder
defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool "true" && killall Finder

# Restart Dock, Finder, and System UI Server processes to apply changes
killall Dock Finder SystemUIServer
