###########
# ZPLUGS  #
###########
source ~/.zplug/init.zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "themes/gianu", from:oh-my-zsh, as:theme
zplug "plugins/colorize", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/github", from:oh-my-zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load


###############################
# BELOW IS YOUNGMOON SPECIFIC #
###############################

set -o vi
set editing-mode vi
export PATH=$PATH:/home/youngmoon01/bin
export TERM=xterm-256color

export JAVA_HOME=/usr/lib/jvm/java-8-oracle/


# aliases
alias ls="ls --color=auto"

# neovim aliases
alias vim="nvim"
alias vi="nvim"
alias vimdiff='nvim -d'
export EDITOR=nvim

# python alias
alias py='python'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/youngmoon01/.sdkman"
[[ -s "/home/youngmoon01/.sdkman/bin/sdkman-init.sh" ]] && source "/home/youngmoon01/.sdkman/bin/sdkman-init.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
