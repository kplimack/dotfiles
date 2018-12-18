# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gnzh"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git)
source $ZSH/oh-my-zsh.sh

autoload -U colors; colors
source /usr/local/etc/zsh-kubectl-prompt/kubectl.zsh
RPROMPT='%{$fg[green]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'

export PATH=$PATH:/usr/local/sbin:/usr/local/go/bin:$HOME/go/bin
export GOPATH=$HOME/go
export AWS_DEFAULT_REGION='us-east-1'
export HAB_ORIGIN_KEYS=jplimack
# Customize to your needs...

if [ -f ~/.shell_common ] ; then
    . ~/.shell_common
fi
if [ -f ~/repos/dotfiles/.shell_common ] ; then
    . ~/repos/dotfiles/.shell_common
fi
if [ -f ~/.awsrc ] ; then
    . ~/.awsrc
fi
if [ -f ~/.brewhub ] ; then
    . ~/.brewhub
fi

if [ -f ~/.config/exercism/exercism_completion.zsh ]; then
  . ~/.config/exercism/exercism_completion.zsh
fi

for sh in /etc/profile.d/*.sh ; do
    [ -r "$sh" ] && . "$sh"
done
unset sh

eval "$(chef shell-init zsh)"
unsetopt nomatch

#
# This must be at the bottom of ~/.zshrc
#
if [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] ; then
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
eval "$(pyenv init -)"
source <(kubectl completion zsh)
export PATH=$PATH:/usr/local/opt/go/libexec/bin
TILLER_NAMESPACE=operations

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export AWS_PROFILE=opseng-production
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

function powerline_precmd() {
    PS1="$(~/go/bin/powerline-go -error $? -shell zsh -newline -colorize-hostname)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi
