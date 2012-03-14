# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline


local knownhosts
knownhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} ) 
zstyle ':completion:*:(ssh|scp|sftp):*' hosts $knownhosts

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mrtazz"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# User specific aliases and functions
alias a2='ssh oak-ss-admin002.sixapart.net'
alias a3='ssh oak-ss-admin003.sixapart.net'
alias a4='ssh oak-ss-admin004.sixapart.net'
alias a5='ssh oak-ss-admin005.sixapart.net'
alias s1='ssh sac-ss-admin001'
alias s2='ssh sac-ss-admin002'
alias one='ssh oak-dev-nebula001.sixapart.net'
alias emacs='emacs -nw'
alias i1='ssh inf001.sacta.videoegg.com'
alias i2='ssh inf002.sfota.videoegg.com'
alias dbha02='ssh -t dbha02.sacpa.videoegg.com'
alias dbha03='ssh -t dbha03.sacpa.videoegg.com'
alias dbha04='ssh -t dbha04.sacpa.videoegg.com'
alias dbha05='ssh -t dbha05.sacpa.videoegg.com'
alias dev='ssh -t kplimack-shift.dev -t'
alias dogb='ssh oak-dog-batch001.say'
alias syncman='ssh oak-dog-batch001.say -t sudo -iu syncman'
alias ddd='ssh root@oak-ss-admin004 "/etc/init.d/named status" && ssh root@oak-ss-admin003 "/etc/init.d/named status"'
alias watch='watch --i=0'
alias push-nagios='ssh oak-ss-admin003 -t push-nagios'
alias rancid='ssh oak-ss-admin004 -t sudo su - rancid'
alias gitup='upstage && ssh oak-ss-admin004 -t gitup'
alias irssi='irssi --connect=irc.saymedia.com --nick=kyle'
alias phpinfo='php -r "phpinfo();"'
alias push-dns='ssh oak-ss-admin004 -t push-dns'
alias snmpwalk='snmpwalk -v2c -c6yhn7ujm'
alias oaknag='ssh oak-ss-admin003 -t push-nagios oak'
alias sacnag='ssh oak-ss-admin003 -t push-nagios sac'
alias acs='apt-cache search'
alias agi='sudo apt-get install'
alias mtr='mtr --curses'

# Set to this to use case-sensitive completion
 CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
 COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

zstyle ':completion:*' users-hosts `cat ~/.hosts`

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/home/kplimack/bin:/sbin:/usr/local/sbin
