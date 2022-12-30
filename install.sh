xcode-select --install
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle
# brew install $(cat ./brew/brew.list)
# brew tap homebrew/cask-fonts # TODO NEEDED?
# brew install --cask $(cat ./brew/brewcask.list)
# consider using brew bundle!

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
# chsh -s /usr/local/bin/zsh
# TODO may need to install plugins and run the above and launch zsh, and also add it to etc/shells
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


stow stows -t ~ --dotfiles

luarocks install fennel
git clone https://github.com/agzam/spacehammer ~/.hammerspoon

npm install yarn

git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes
git clone https://github.com/butterywombat/nord-kitty.git ~/code/opensource
ln -s ~/code/opensource/nord-kitty/Nord.conf ~/.config/kitty/kitty-themes/Nord.conf
# this is kinda convoluted, maybe some other impl

# is the below automatic?
# ln -s ~/.vim ~/.config/nvim

# after the above,
# ln -s coc-settings.json ~/config/nvim/coc-settings.json
# ln -s ~/.vimrc ~/config/nvim/init.vim

npm install -g bunyan create-react-app gulp gtop leetcode-cli mocha ndb nodemon prettier server sinon source-map-explorer standard typescript

# TODO not sure where exa aliases are - l=ls -lah

# TODO make sure to sign in to CODE and get settings
# TODO ensure all kitty settings n themes etc is working

# TODO all the mac osx settings, mashup. couldn't find modifier key stuff
defaults write com.apple.finder AppleShowAllFiles TRUE
# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

echo ""
echo "Disabling OS X Gate Keeper"
echo "(You'll be able to install any app you want from here on, not just Mac App Store apps)"
sudo spctl --master-disable

echo ""
echo "Increasing the window resize speed for Cocoa applications whether you like it or not"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

echo ""
echo "Disabling the 'Are you sure you want to open this application from the Internet?' dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

echo ""
echo "Enabling tap to click for this user and for the login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo ""
echo "Increasing sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# echo ""
# echo "Disabling press-and-hold for keys in favor of key repeat "
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

echo ""
echo "Setting a blazingly fast keyboard repeat rate (ain't nobody got time fo special chars while coding!)"
defaults write NSGlobalDomain KeyRepeat -int 0

###############################################################################
# Screen                                                                      #
###############################################################################
echo "Enabling subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

###############################################################################
# Finder                                                                      #
###############################################################################

echo ""
echo "Automatically open a new Finder window when a volume is mounted"
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

echo ""
echo "Finder: showing all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo ""
echo "Avoiding creating stupid .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo ""
echo "Showing the ~/Library folder"
chflags nohidden ~/Library

###############################################################################
# Dock & Mission Control
###############################################################################

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use
# the Dock to launch apps.
# defaults write com.apple.dock persistent-apps -array

echo ""
echo "Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate"
defaults write com.apple.dock tilesize -int 36

echo ""
echo "Speeding up Mission Control animations and grouping windows by application"
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock "expose-group-by-app" -bool true

echo ""
echo "Setting Dock to auto-hide and removing the auto-hiding delay"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

echo ""
echo "Setting Dock to 2D mode"
defaults write com.apple.dock no-glass -boolean YES

# TODO make sure this is right
echo ""
echo "Pinning the Dock to the right side of the screen"
# defaults write com.apple.dock pinning -string "start"
# not sure if this needs to be 'end instead'
defaults write com.apple.dock orientation right


###############################################################################
# Messsages, Address Book and iTunes                                          #
###############################################################################
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
