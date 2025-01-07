source ~/.zplug/init.zsh
eval "$(starship init zsh)"


source <(fzf --zsh)


HISTSIZE=50000
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt sharehistory
setopt hist_find_no_dups


alias ls="ls --color=auto"

alias vim='nvim'
alias vi='nvim'
alias vimdiff='nvim -d'

alias py='python3'
alias python='python3'

export EDITOR=nvim
set -o vi
set editing-mode vi
export TERM=xterm-256color


zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "plugins/colorize", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/github", from:oh-my-zsh
zplug "jeffreytse/zsh-vi-mode"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# source per-machine configurations
source ~/.zshrc.machine
