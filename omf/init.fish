# if not set -q TMUX
#     set -g TMUX tmux new-session -d -s base
#     eval $TMUX
#     tmux attach-session -d -t base
# end

fish_vi_key_bindings
set -U EDITOR nvim

set -g theme_nerd_fonts yes
set -g theme_color_scheme gruvbox

if status is-interactive # or is-login if you prefer
    set -gx NVM_DIR (brew --prefix nvm)
end

set -gx FZF_DEFAULT_COMMAND 'rg --files --no-ignore-vcs --hidden'
set -gx FZF_CTRL_T_COMMAND 'rg --files --no-ignore-vcs --hidden'
set -gx FZF_DEFAULT_OPTS '--reverse --inline-info'
set -gx FZF_COMPLETION_TRIGGER '~~'
set -gx BAT_THEME 'Nord'

# TODO not working, command substitutions not allowed err. turn into fn?
# alias openUnstaged='v (git status --porcelain | awk "{print $2}")'
alias l='ls -la'

# TODO folder for all the scripts instead of just floating in ~
# TODO folder for gitconfigs too

[ -f ~/.cross-sh-aliases.zsh ] && . ~/.cross-sh-aliases.zsh

[ -f ~/.lc.zsh ] && . ~/.lc.zsh
