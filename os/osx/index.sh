#!/usr/bin/env bash

set -e

# modules
source "$lib/symlink/index.sh"
source "$lib/is-osx/index.sh"

# Only run if on a Mac
if [ 0 -eq `osx` ]; then
  exit 0
fi

# exit 1
# paths
osx="$os/osx"

# Run each program
sh "$osx/defaults.sh"
sh "$osx/binaries.sh"
sh "$osx/apps.sh"

# Symlink the profile
if [[ ! -e "$HOME/.bash_profile" ]]; then
  echo "symlinking: $osx/profile.sh => $HOME/.bash_profile"
  symlink "$osx/profile.sh" "$HOME/.bash_profile"
  source $HOME/.bash_profile
else
  echo "$HOME/.bash_profile already exists. remove and run again."
fi

# List next steps here as a checklist so I don't have to remember everytime
echo ""
echo "If new install, now go do the following:"
echo ""
echo "* System Preferences"
echo "  * Turn on FileVault"
echo "  * Check Firewall settings"
echo "  * Set Sharing settings"
echo "  * Add users"
echo "* Setup Dropbox"
echo "* App Settings"
echo "  * 'mackup restore'"
echo "* Setup 1Password"
echo "* Browser settings"
echo "  * Set Safari preferences (no passwords)"
echo "  * Set Firefox preferences (no passwords)"
echo "  * Set Google Chrome preferences (no passwords)"
echo "* Build Divvy shortcuts"
