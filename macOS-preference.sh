#!/bin/bash

touch ~/.hushlogin
mkdir -p ~/Desktop/Screenshots

defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock autohide-time-modifier -float 0.0
defaults write com.apple.dock "show-recents" -bool "false"
defaults write com.apple.screencapture type JPG
defaults write com.apple.screencapture "disable-shadow" -bool "true"
defaults write com.apple.screencapture "location" -string "$HOME/Desktop/Screenshots"
defaults write com.apple.Finder "AppleShowAllFiles" -bool "true"
defaults write com.apple.Music "userWantsPlaybackNotifications" -bool "false"
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.TimeMachine "DoNotOfferNewDisksForBackup" -bool "true"
defaults write com.apple.dock "enable-spring-load-actions-on-all-items" -bool "true"
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
defaults write com.apple.dock "mru-spaces" -bool "false"
defaults write com.apple.dock "static-only" -bool "true" && killall Dock
defaults write com.apple.finder "ShowPathbar" -bool "true"
defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool "true" && killall Finder

killall Dock Finder SystemUIServer
