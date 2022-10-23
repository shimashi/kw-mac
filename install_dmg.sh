#!/bin/bash
function installdmg () {
    search_dir=$1
    for file in "$search_dir"*\.dmg
    do
      echo "Installing $file"
      VOLUME=`hdiutil attach $file | grep Volumes |  awk  '{for (i=3;i<NF+1;i++) {printf "%s ",$i}}'`
      VOLUME=`echo $VOLUME |sed 's/ *$//g'`
      if [ -e "$VOLUME"/*.app ]; then
        cp -rf "$VOLUME"/*.app /Applications
      elif [ -e "$VOLUME"/*.pkg ]; then
        package=$(ls -1 "$VOLUME" | grep .pkg | head -1)
        installer -pkg "$VOLUME"/"$package" -target /
      fi
      hdiutil unmount "$VOLUME"
    done
}

installdmg "./"