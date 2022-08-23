#!/bin/bash
# Input is currentState($1) and totalState($2)
function ProgressBar {
# Process data
    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done
# Build progressbar string lengths
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

# Build progressbar strings and print the ProgressBar line
# Output example:                           
# Progress : [########################################] 100%
printf "\rProgress : [${_fill// /#}${_empty// /-}] ${_progress}%%"

}

_start=1

printf -- "\033[37m Hello welcome to Kellan's bash script for bootstrapping MacOS \033[0m\n"

flag=true


xcode-select -p 1>/dev/null;xcode_installed=$?
if [ $xcode_installed -ne 0 ]; then
  while true; do
  read -n1 -p "Apple's command line tools (xcode-select) is not installed, would you like to install it? Yes[y]/No[n] " xcode_install
    case $xcode_install in  # case statement checking userinput for var $xcode_installed  
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
fi

# while true; do  # Only breaks out of while loop once user chooses y/Y or n/N
#   echo
#   read -n1 -p "Have you installed Apple's command line tools (xcode-select)? Yes[y]/No[n]" xcode_installed

#   case $xcode_installed in  # case statement checking userinput for var $xcode_installed  
#     y|Y) 
#         echo ;
#         echo "You can go forward";
#         break;;
#     n|N) 
#         echo;
#         printf -- "\033[31m Please run 'xcode-select install', then try running this script again \033[0m\n";
#         exit;;
#     *)  
#         echo;
#         printf "\033[31m Please enter 'y' for Yes or 'n' for No \033[0m\n";;
#     esac
# done

while true; do # Only breaks out of while loop once user chooses y/Y or n/N
  echo
  read -n1 -p "Would you like to use this repo's zsh config? Yes[y]/No[n] " zshrc_config
  echo
  case $zshrc_config in
    y|Y)
      cp zshrc ~/.zshrc
      flag=true;
      echo "zsh conf set"
      if [ -d ~/.oh-my-zsh ]; then
        echo "oh-my-zsh already installed"
      else
        echo "oh-my-zsh is not installed, busy installing"
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        echo "oh-my-zsh setup"
      fi
      break;;
    n|N)
      flag=false;
      break;;
    *)  
      echo;
      printf "\033[31m Please enter 'y' for Yes or 'n' for No \033[0m\n";;
  esac
done

# Checks if Homebrew is installed
which -s brew
if [[ $? != 0 ]] ; then
    brew_check=true
else
    brew_check=false
fi

if $brew_check -eq false; then
  while true; do # Only breaks out of while loop once user chooses y/Y or n/N
  echo
  read -n1 -p "Would you like to install homebrew? Yes[y]/No[n]" brew_install

  case $brew_install in
    y|Y)
      # Installs Homebrew
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      break;;

    n|N)
      break;;

    *)  
      echo;
      printf "\033[31m Please enter 'y' for Yes or 'n' for No \033[0m\n";;
  esac
done
fi

while true; do # Only breaks out of while loop once user chooses y/Y or n/N
  echo
  read -n1 -p "Would you like to install my brew package list? Yes[y]/No[n]" brewfileflag

  case $brewfileflag in
    y|Y)
      brewpackages=true
      break;;

    n|N)  
      brewpackages=false
      break;;

    *)  
      echo;
      printf "\033[31m Please enter 'y' for Yes or 'n' for No \033[0m\n";;
  esac
done

if $brewpackages -eq true; then
while true; do # Only breaks out of while loop once user chooses 1, 2 or 3
      echo
      read -n1 -p "Would you like to install full list of packages, minimal packages, or development only packages? 1/2/3 " brewfiletype
      echo

      case $brewfiletype in 
      1)
        brew bundle --file BrewfileFull
        break;;

      2)
        brew bundle --file BrewfileMin
        break;;

      3)
        brew bundle --file BrewfileDev
        break;;
      
      *)  
        echo;
        printf "\033[31m Please enter 1, 2 or 3 \033[0m\n";;
      esac
    done
fi

echo


while true; do # Only breaks out of while loop once user chooses y/Y or n/N
  echo
  read -n1 -p "Would you like to set my prefrences? Yes[y]/No[n] " pref_ans

  case $pref_ans in
    y|Y)
      _pref=true;
      break;;
      
    n|N)
      _pref=false;
      break;;
    *)  
      echo;
      printf "\033[31m Please enter 'y' for Yes or 'n' for No \033[0m\n";;
  esac
done

if $_pref -eq true; then
defaults write com.apple.dock "orientation" -string "bottom" && killall Dock;
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
defaults write com.apple.TimeMachine "DoNotOfferNewDisksForBackup" -bool "true" 
defaults write com.apple.dock "enable-spring-load-actions-on-all-items" -bool "true" && killall Dock
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true" && killall Finder
defaults write com.apple.dock "mru-spaces" -bool "false" && killall Dock
defaults write com.apple.dock persistent-apps -array && killall Dock
printf -- '\n';
printf -- '\033[32m Finished!'
exit 0;
fi
