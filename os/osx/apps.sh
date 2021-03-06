#
# Application installer (via brew-cask)
#

set -e

# Apps
apps=(
  # Utilities
  alfred
  appcleaner
  iterm2
  # seil
  caffeine
  divvy
  growler
  pins
  
  # Browsers
  firefox
  google-chrome
  aviator
  
  # Communication
  # slack
  # mailbox
  # thunderbird
  skype
  
  # Media
  vlc
  # spotify
  
  # Storage & Management
  dropbox
  hazel
  cloudup
  transmission
  transporter-desktop
  # transmit  
  # arq
  carbon-copy-cloner
  crashplan
  daisydisk
  gemini
  
  # Quicklook
  qlcolorcode
  qlmarkdown
  # qlprettypatch
  qlstephen
  quicklook-json
  
  # Text editors
  sublime-text
  # sublime-text3
  # atom
  nvalt
  textmate
  coda
  
  # Design
  balsamiq-mockups
  # sketch
  
  # Other Developer Tools
  virtualbox
  tower
  apikitchen
  codekit
  sketchup
  mamp
  # screenflick
  # vagrant
  
  # Just Plain Other
  ynab
  libreoffice
  # flash
  # shiori
  # flux
  # font-m-plus
  
  # Other not yet in cask
  # 1password
  # folders-factory
  # hardware-growler
)

# fonts
fonts=(
  # font-m-plus
  font-clear-sans
  font-roboto
)

# Specify the location of the apps
appdir="/Applications"

# Check for Homebrew
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

main() {

  # Ensure homebrew is installed
  homebrew

  # Install homebrew-cask
  echo "installing cask..."
  # brew tap phinze/homebrew-cask
  # brew install brew-cask
  brew install caskroom/cask/brew-cask

  # Tap alternative versions
  brew tap caskroom/versions

  # Tap the fonts
  brew tap caskroom/fonts

  # install apps
  echo "installing apps..."
  brew cask install --appdir=$appdir ${apps[@]}

  # install fonts
  echo "installing fonts..."
  brew cask install ${fonts[@]}

  # link with alfred
  alfred
  cleanup
}

homebrew() {
  if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

alfred() {
  brew cask alfred link
}

cleanup() {
  brew cleanup
}

main "$@"
exit 0
