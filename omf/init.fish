if not set -q TMUX
    set -g TMUX tmux new-session -d -s base
    eval $TMUX
    tmux attach-session -d -t base
end

fish_vi_key_bindings
set -U EDITOR nvim

set -g theme_nerd_fonts yes
set -g theme_color_scheme gruvbox

set -gx NVM_DIR (brew --prefix nvm)

set -gx FZF_DEFAULT_COMMAND 'rg --files --no-ignore-vcs --hidden'
set -gx FZF_CTRL_T_COMMAND 'rg --files --no-ignore-vcs --hidden'
set -gx FZF_COMPLETION_TRIGGER '~~'

alias v='nvim'
alias vim='nvim'
alias vimdiff='nvim -d'
alias l='ls -la'

alias t='tmux'
alias hok='z ui && wa'
alias dayone='dayone2'

alias godebug="export NODE_ENV='lcdev' node --inspect ./ | bunyan"
alias godemo="NODE_ENV=demo LOCAL_AUTH=true yarn start"
alias godemob="NODE_ENV=demo LOCAL_AUTH=true ndb yarn start"
alias godemobug="NODE_ENV='demo' LOCAL_AUTH=true node --inspect ./node_modules/ui-zephyr/src/bin/zephyr-transpile | bunyan"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias testnode="node_modules/.bin/mocha --require node_modules/ui-zephyr/dist/shared_modules/node-test-runner/babel-setup.js --require src/node_modules/client-test-setup/client-test-setup.js src/pages/til/til-client.js"
alias wa="yarn watchAssets"
alias gpr="git pull --rebase origin develop"
alias amend!="gca --amend -C HEAD"
