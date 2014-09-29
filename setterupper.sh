#!/bin/bash

if [ ! -z $DEBUG ] ; then
#    set -x
    set -e
fi

DOTFILES_DIR=$(dirname "$0"); SCRIPT_PATH=$(eval "cd \"$SCRIPT_PATH\" && pwd")
EXCLUDE='(setterupper|.el|~|README|lock|#)'

cd
for i in $(ls -a $SCRIPT_PATH | egrep -v "$EXCLUDE") ; do
    CMD="ln -nfs $DOTFILES_DIR/$i"
    if [ -z $DEBUG ] ; then
        $(CMD)
    else
        echo "$CMD"
    fi
done

cd ~/.oh-my-zsh
git submodule update --init
