# xcode-select --install
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle
# brew install $(cat ./brew/brew.list)
# brew tap homebrew/cask-fonts # TODO NEEDED?
# brew install --cask $(cat ./brew/brewcask.list)
# consider using brew bundle!

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
chsh -s /usr/local/bin/zsh
# may need to run the above and launch zsh, and also add it to etc/shells but didn't seem like it
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


stow stows -t ~ --dotfiles
# maybe vimrc one not needed

ln -s ~/.vimrc ~/.config/nvim/init.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
ln -s coc-settings.json ~/.config/nvim/coc-settings.json

luarocks install fennel
git clone https://github.com/agzam/spacehammer ~/.hammerspoon

ln -s ./kitty ~/.config/kitty
git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes
git clone https://github.com/butterywombat/nord-kitty.git ~/code/opensource
ln -s ~/code/opensource/nord-kitty/Nord.conf ~/.config/kitty/kitty-themes/Nord.conf
# this is kinda convoluted, maybe some other impl

npm install -g yarn bunyan eslint create-react-app gulp gtop leetcode-cli mocha ndb nodemon prettier server sinon source-map-explorer standard typescript
# note npm installs yarn (as recommended) so must do this step before going into neovim and PlugInstalling

# note not sure where exa aliases live - l=ls -lah

# TODO make sure to sign in to CODE and get settings, and webstorm, datagrip with licenses

. macSettings.sh
# TODO these dont seem to be working?
#
# FOR LC:
# remember to 1) copy .npmrc over for artifactory, 2) copy keysecure (also has zscaler certs), 2.5) copy zscaler cert to end of /etc/ssl/cert.pem 3) install git pr script

# TODO:
# 2.6) zscaler workaround for datagrip other intelliJ
# TODO still strange: vscode doesn't detect node

# I think these are buggy
# git clone https://github.com/dxuehu/webstormsettings.git ~/code/webstormsettings
# also not sure if the gitconfigs are working properly

