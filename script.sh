#!/bin/bash
# 1.1 Input is currentState($1) and totalState($2)
function ProgressBar {
# Process data
    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done
# Build progressbar string lengths
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

# 1.2 Build progressbar strings and print the ProgressBar line
# 1.2.1 Output example:                           
# 1.2.1.1 Progress : [########################################] 100%
printf "\rProgress : [${_fill// /#}${_empty// /-}] ${_progress}%%"

}

# Variables
_start=1

# This accounts as the "totalState" variable for the ProgressBar function
_end=100

echo "Hello welcome to Kellan's bash script for bootstrapping MacOS"
#read -n1 -p "Have you installed Apple's command line tools (xcode-select)? Yes[y]/No[n] " xcode_installed

echo 

flag=true

while true; do  # only breaks out of while loop once user chooses y/Y or n/N
  echo
  read -n1 -p "Have you installed Apple's command line tools (xcode-select)? Yes[y]/No[n] " xcode_installed

  case $xcode_installed in  # case statement checking userinput for var $xcode_installed  
    y|Y) 
        echo ;
        echo "You can go forward";
        break;;
    n|N) 
        echo;
        echo "Please run 'xcode-select install', then try running this script again";
        exit;;
    *)  
        echo;
        echo "Please enter 'y' for Yes or 'n' for No";;
    esac
done

while true; do
  echo
  read -n1 -p "Would you like to use this repo's zsh config? Yes[y]/No[n] " zshrc_config

  case $zshrc_config in
    y|Y)
      flag=true;
      break;;
    n|N)
      flag=false;
      break;;
  esac
done

echo
echo 

if $flag -eq true; then
echo -ne '##                        (5%)\r'
defaults write com.apple.dock "orientation" -string "left" && killall Dock;
sleep 0.1
echo -ne '####                      (15%)\r'
defaults write com.apple.dock "autohide" -bool "true" && killall Dock;
sleep 0.1
echo -ne '#######                   (33%)\r'
defaults write com.apple.dock autohide-time-modifier -float 0.125 && killall Dock;
sleep 0.9
defaults write com.apple.dock "show-recents" -bool "false" && killall Dock;
sleep 0.4
echo -ne '############              (55%)\r'
defaults write com.apple.screencapture type JPG;
sleep 0.1
echo -ne '##############            (66%)\r'
defaults write com.apple.screencapture "disable-shadow" -bool "true" ;
sleep 0.8
echo -ne '################          (77%)\r'
defaults write com.apple.screencapture "location" -string "~/Pictures/Screenshots" && killall SystemUIServer;
sleep 0.5
echo -ne '##################        (88%)\r'
defaults write com.apple.Finder "AppleShowAllFiles" -bool "true" && killall Finder;
sleep 0.1
echo -ne '#####################     (95%)\r'
defaults write com.apple.Music "userWantsPlaybackNotifications" -bool "true" && killall Music;
defaults write -g ApplePressAndHoldEnabled -bool false;
defaults write com.apple.dock autohide-time-modifier -float 0; killall Dock ;
defaults write com.apple.dock autohide-delay -float 0; killall Dock;
sleep 0.2
echo -ne '######################### (100%)\r'

sleep 0.1
echo -ne '\n'
echo 'Finished!'
fi
