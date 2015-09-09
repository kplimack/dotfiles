#!/bin/bash

sudo -v

if [ ! -z $DEBUG ] ; then
#    set -x
    set -e
fi

if [ "$1" -eq "--source"] ; then
    INSTALL='source'
else
    INSTALL='brew'
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
echo "ENTER YOUR SYSTEM PASSWORD: "
chsh -s $(which zsh)

# homebrew with xcode!
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install pv tree autoconf automake

# emacs setup

if [ $INSTALL == 'source' ]; then
    
    if [ -e /usr/local/share/emacs ] ; then
	sudo rm -rf /usr/local/share/emacs
    fi
    
    cd repos
    git clone -b emacs-24 git@github.com:emacs-mirror/emacs.git
    cd emacs
    ./autogen.sh
    ./configure --without-x --with-ns
    make && sudo make install
elif [ $INSTALL == 'brew' ]; then
    brew install --with-cocoa --srgb emacs
    brew linkapps emacs
fi

mkdir -p $HOME/.emacs.d/personal/savefile/
touch $HOME/.emacs.d/personal/savefile/savehist
touch $HOME/.password.el.gpg

if [ ! -d /etc/profile.d ] ; then
    sudo mkdir -p /etc/profile.d
    sudo touch /etc/profile.d/jake.sh
fi

zsh