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

# TODO all the mac osx settings
# TODO make sure to sign in to CODE and get settings
