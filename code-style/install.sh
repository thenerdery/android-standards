#!/bin/bash
# Installs The Nerdery's Android Studio configs into your user configs.

echo "Installing Nerdery Android Studio configs..."

CONFIGS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/configs"
# escape spaces in path
CONFIGS=$(echo $CONFIGS | sed 's/ /\\ /g')

for i in $HOME/Library/Preferences/IntelliJIdea*  \
         $HOME/Library/Preferences/IdeaIC*        \
         $HOME/Library/Preferences/AndroidStudio* \
         $HOME/.IntelliJIdea*/config              \
         $HOME/.IdeaIC*/config                    \
         $HOME/.AndroidStudio*/config
do
  if [[ -d $i ]]; then

    # Install codestyles
    mkdir -p $i/codestyles
    cp -frv "$CONFIGS/codestyles"/* $i/codestyles

    # Install inspections
    mkdir -p $i/inspection
    cp -frv "$CONFIGS/inspection"/* $i/inspection

    # Install options ("Exclude from Import and Completion")
    mkdir -p $i/options
    cp -frv "$CONFIGS/options"/* $i/options

  fi
done

echo "Done."
echo ""
echo "Restart Android Studio, go to preferences, and apply 'NerderyAndroid'."
