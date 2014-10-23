#!/bin/bash

if [ ! -z $DEBUG ] ; then
#    set -x
    set -e
fi

DOTFILES_DIR="$HOME/repos/dotfiles"; SCRIPT_PATH=$(eval "cd \"$SCRIPT_PATH\" && pwd")
EXCLUDE='(setterupper|.el|~|README|lock|#|\.Trash)'

cd $HOME
for i in $(ls -a $DOTFILES_DIR | egrep -v "$EXCLUDE" | egrep -v "^\.+$") ; do
    if [ ! -d $HOME/$i ] ; then
	CMD="ln -nfs $DOTFILES_DIR/$i"
    fi
    if [ -z $DEBUG ] ; then
        $($CMD)
    else
        echo "$CMD"
    fi
done

cd ~/.oh-my-zsh
git submodule update --init
chsh -s $(which zsh)

# emacs setup
mkdir -p $HOME/.emacs.d/personal/savefile/
touch $HOME/.emacs.d/personal/savefile/savehist
touch $HOME/.password.el.gpg
