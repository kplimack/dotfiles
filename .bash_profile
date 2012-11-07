# .bash_profile


if [ $(uname -s) == "Darwin" ] ; then
    ### Start-Keychain ### 
    /usr/bin/keychain $HOME/.ssh/id_rsa
    source $HOME/.keychain/$HOSTNAME-sh
    ### End-Keychain ###
fi

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin
export PATH

ssh-add
