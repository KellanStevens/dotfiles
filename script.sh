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

_start=1

printf -- "\033[37m Hello welcome to Kellan's bash script for bootstrapping MacOS \033[0m\n"

flag=true

while true; do  # only breaks out of while loop once user chooses y/Y or n/N
  echo
  read -n1 -p "Have you installed Apple's command line tools (xcode-select)? Yes[y]/No[n]" xcode_installed

  case $xcode_installed in  # case statement checking userinput for var $xcode_installed  
    y|Y) 
        echo ;
        echo "You can go forward";
        break;;
    n|N) 
        echo;
        printf -- "\033[31m Please run 'xcode-select install', then try running this script again \033[0m\n";
        exit;;
    *)  
        echo;
        printf "\033[31m Please enter 'y' for Yes or 'n' for No \033[0m\n";;
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

while true; do
  echo
  read -n1 -p "Is Homebrew already installed? Yes[y]/No[n] " brew_check

  case $brew_check in
    y|Y)
      cbrewflag=true;
      break;;
    n|N)
      cbrewflag=false;
      break;;
  esac
done

if $brew_check -eq false; then
  while true; do
  echo
  read -n1 -p "Would you like to install homebrew? Yes[y]/No[n]" brew_install
  #read -n1 -p "Would you like to install Homebrew packages? Yes[y]/No[n] " brew_file

  case $brew_install in
    y|Y)
      brewinsallflag=true;
      break;;
    n|N)
      brewinsallflag=false;
      break;;
  esac
done
fi

if $brewinsallflag -eq true; then
  printf -- '\033[33m You will need to input root password for installing Homebrew \033[0m\n';
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

fi

if $brewfileflag -eq true; then
  brew bundle --file Brewfile
fi

echo

while true; do
  echo
  read -n1 -p "Would you like to setup fish as your default shell? Yes[y]/No[n]" fish_set

  case $fish_set in 
    y|Y)
      echo "Setting FISH as default shell"
      chsh -s /usr/local/bin/fish
      echo function fish_greeting\n\tneofetch\nend >> ~/.config/fish/config.fish
    n|N)
      break;;
    esac
done

while true; do
  echo
  read -n1 -p "Would you like to change prefrences? Yes[y]/No[n] " pref_ans

  case $pref_ans in
    y|Y)
      _pref=true;
      break;;
    n|N)
      _pref=false;
      break;;
  esac
done

if $_pref -eq true; then
defaults write com.apple.dock "orientation" -string "left" && killall Dock;
printf -- "\e[2m - Process (1/12)\n";
defaults write com.apple.dock "autohide" -bool "true" && killall Dock;
printf -- "\e[2m - Process (2/12)\n";
defaults write com.apple.dock autohide-time-modifier -float 0.125 && killall Dock;
printf -- "\e[2m - Process (3/12)\n";
defaults write com.apple.dock "show-recents" -bool "false" && killall Dock;
printf -- "\e[2m - Process (4/12)\n";
defaults write com.apple.screencapture type JPG;
printf -- "\e[2m - Process (5/12)\n";
defaults write com.apple.screencapture "disable-shadow" -bool "true" ;
printf -- "\e[2m - Process (6/12)\n";
defaults write com.apple.screencapture "location" -string "~/Pictures/Screenshots" && killall SystemUIServer;
printf -- "\e[2m - Process (7/12)\n";
defaults write com.apple.Finder "AppleShowAllFiles" -bool "true" && killall Finder;
printf -- "\e[2m - Process (8/12)\n";
defaults write com.apple.Music "userWantsPlaybackNotifications" -bool "true";
printf -- "\e[2m - Process (9/12)\n";
defaults write -g ApplePressAndHoldEnabled -bool false;
printf -- "\e[2m - Process (10/12)\n";
defaults write com.apple.dock autohide-time-modifier -float 0; killall Dock ;
printf -- "\e[2m - Process (11/12)\n";
defaults write com.apple.dock autohide-delay -float 0; killall Dock;
printf -- "\e[2m - Process (12/12)\n";

printf -- '\n';
printf -- '\033[32m Finished!'
exit 0;
fi
