alias ls="exa --icons --group-directories-first -H"
alias v='nvim'
alias vim='nvim'
alias vimdiff='nvim -d'
alias kit="v ~/.config/kitty/kitty.conf"
alias t='tmux'

alias amend!="gca --amend -C HEAD"
alias fix='$EDITOR +/HEAD `git diff --name-only --diff-filter=U | uniq`'

# lc
alias hok='z ui && wa'
alias godebug="export NODE_ENV='lcdev' node --inspect ./ | bunyan"
alias godemo="NODE_ENV=demo LOCAL_AUTH=true yarn start"
alias gostage="NODE_ENV=stage LOCAL_AUTH=true yarn start"
alias godemob="NODE_ENV=demo LOCAL_AUTH=true ndb yarn start"
alias godemobug="NODE_ENV='demo' LOCAL_AUTH=true node --inspect ./node_modules/ui-zephyr/src/bin/zephyr-transpile | bunyan"
alias gostagebug="NODE_ENV='stage' LOCAL_AUTH=true node --inspect ./node_modules/ui-zephyr/src/bin/zephyr-transpile | bunyan"
alias lo="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias testnode="ALLOW_CONFIG_MUTATIONS=true node_modules/.bin/mocha --require node_modules/ui-zephyr/src/shared_modules/node-test-runner/babel-setup.js --require src/shared_modules/client-test-setup/client-test-setup.js" # add path-to-test.js and maybe --inspect-brk
alias tn="node --inspect-brk node_modules/.bin/jest --runInBand"
alias tc="node --inspect-brk node_modules/.bin/jest --config ./jestClient.config.js --runInBand"
alias debug="node_modules/.bin/jest -i --inspect-brk" # add path-to-test.js and maybe --inspect-brk
alias wa="node_modules/ui-zephyr/src/bin/zephyr-webpack-watch"

alias gpr="git pull --rebase origin develop"
alias gcgmail='git config --local user.email dxuehu@gmail.com'
alias gcworkmail='git config --local user.email xhu@lendingclub.com'

