export PATH=$HOME/bin:/usr/local/bin:$HOME/.lc2/bin:$PATH
export ZSH="/Users/xhu/.oh-my-zsh"

# ZSH_THEME="agnoster"
POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME='powerlevel9k/powerlevel9k'
COMPLETION_WAITING_DOTS='true'
DISABLE_UPDATE_PROMPT=true # auto update without prompt

export EDITOR='nvim'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_CTRL_T_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_DEFAULT_OPTS="--reverse --inline-info"
export BAT_THEME='Nord'

# todo figure out which plugins I need/uninstall
# plugins=(git tmux nvm vi-mode z yarn command-not-found zsh-syntax-highlighting)
plugins=(git nvm vi-mode z yarn command-not-found zsh-syntax-highlighting)

. $ZSH/oh-my-zsh.sh

# export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# # [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm which one?
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

open-unstaged() {
  v `git status --porcelain | awk '{print $2}'`
}
# doesn't work?
# alias openUnstaged="v $( git status --porcelain | awk '{print $2}' ) "
#
# aliases
[ -f ~/.cross-sh-aliases.zsh ] && . ~/.cross-sh-aliases.zsh

[ -f ~/.lc.zsh ] && . ~/.lc.zsh

# attempt to fix tmux but didn't work
# outside of tmux, make sure TERM is xterm-256color
# [ -z "$TMUX" ] && export TERM=xterm-256color

# customize colors
# make sure you handle both TERM=xterm-256color and TERM=screen-256color cases


# try to fix tmux powerline printed multiple times
# export LC_ALL=en_US.UTF-8 export LANG=en_US.UTF-8 export LANGUAGE=en_US.UTF-8
# if not inside tmux already, replace current bash process by tmux
# [ -z "$TMUX" ] && exec tmux

version_check() {
  # Node version
  echo "* Node version:"
  node --version
  # Operating System
  echo "* Operating System:"
  sw_vers
  # Zephyr version
  echo "* Zephyr version:"
  cat ./node_modules/ui-zephyr/package.json | grep \"version\": | sed -e 's/^[ \t]*//' -e 's/\"//g' -e 's/\,//g'
  # Boreas version
  echo "* Boreas version:"
  cat ./node_modules/ui-boreas/package.json | grep \"version\": | sed -e 's/^[ \t]*//' -e 's/\"//g' -e 's/\,//g'
  echo "* Docker version: N/A"
  echo "* Jenkins pipeline version/Url: N/A"
}
app_start() {
  NODE_ENV=${1:-demo} node $2 node_modules/ui-zephyr/src/bin/zephyr-transpile || NODE_ENV=${1:-demo} node $2 node_modules/ui-zephyr/dist/bin/zephyr-transpile
}

[ -f ~/.fzf.zsh ] && . ~/.fzf.zsh
