#!/bin/bash

# declare -a packages=("p7zip" "audacity" "firefox" "gimp" "handbrake" "inkscape" "krita" "libreoffice" "tux-paint" "vlc" "chromium-browser")
declare -a packages=(libreoffice zoom skype brave bitwarden googlchrome audacity firefox gimp handbrake inkscape krita vlc)

for package in ${packages[@]}; do
    echo "******************" 
    echo $package
    echo "******************"
    echo install  $package
    ./Installomator/Installomator.sh $package DEBUG=0 NOTIFY=silent
done
