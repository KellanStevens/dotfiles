#!/bin/bash

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