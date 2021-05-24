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

_command(){
  case $i in
  1) defaults write com.apple.dock "orientation" -string "left" && killall Dock;;
  2) defaults write com.apple.dock "autohide" -bool "true" && killall Dock;;
  3) defaults write com.apple.dock autohide-time-modifier -float 0.125 && killall Dock;;
  4) defaults write com.apple.dock "show-recents" -bool "false" && killall Dock;;
  5) defaults write com.apple.screencapture type JPG;;
  6) defaults write com.apple.screencapture "disable-shadow" -bool "true" ;;
  7) defaults write com.apple.screencapture "location" -string "~/Pictures/Screenshots" && killall SystemUIServer;;
  8) defaults write com.apple.Finder "AppleShowAllFiles" -bool "true" && killall Finder;;
  9) defaults write com.apple.Music "userWantsPlaybackNotifications" -bool "true" && killall Music;;
  esac
}
_command

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
echo $flag

i=1

for i in {1..9}; do
  _command $i
done

# if $flag -eq true; then
# # echo -ne '#####                     (33%)\r'
# # sleep 1
# # echo -ne '#############             (66%)\r'
# # sleep 1
# # echo -ne '#######################   (100%)\r'
# # echo -ne '\n'
  
#   echo "Moving dock to left"
#   defaults write com.apple.dock "orientation" -string "left" && killall Dock
  
#   echo "Enabling dock autohide"
#   defaults write com.apple.dock "autohide" -bool "true" && killall Dock
  
#   echo "Increasing dock unhide animation"
#   defaults write com.apple.dock autohide-time-modifier -float 0.125 && killall Dock
  
#   echo "Disabling recent apps in dock"
#   defaults write com.apple.dock "show-recents" -bool "false" && killall Dock

#   echo "Changing screenshot image type to JPG"
#   defaults write com.apple.screencapture type JPG

#   echo "Disabling screenshot shadow"
#   defaults write com.apple.screencapture "disable-shadow" -bool "true"  

#   echo "Setting screenshot location to /Documents/Screenshots"
#   defaults write com.apple.screencapture "location" -string "~/Pictures/Screenshots" && killall SystemUIServer

#   echo "Show hidden files enabled"
#   defaults write com.apple.Finder "AppleShowAllFiles" -bool "true" && killall Finder

#   echo "Show Music song notifications"
#   defaults write com.apple.Music "userWantsPlaybackNotifications" -bool "true" && killall Music
#   for number in $(seq ${_start} ${_end})
#     do
#     sleep 0.01
#     ProgressBar ${number} ${_end}
#     done
#     printf '\nFinished!\n'
#     fi


  