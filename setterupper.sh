#!/bin/bash

sudo -v

if [ ! -z $DEBUG ] ; then
    set -x
    set -e
fi

#
# this is just for the emacs install.
#
if [ "$1" == "--source" ] ; then
    INSTALL='source'
else
    INSTALL='brew'
fi

#
# Link all the dotfiles to homedir
#
DOTFILES_DIR="$HOME/repos/dotfiles";
EXCLUDE='(setterupper|.el|~|README|lock|#|\.Trash|^\.git)'

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

#
# Install XCode CLI Tools
#
sudo xcode-select --install

cd ~/.oh-my-zsh
git submodule update --init
echo "ENTER YOUR SYSTEM PASSWORD: "
chsh -s $(which zsh)

#
# Install Homebrew and some packages
#

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
BREW_APPS="pv tree autoconf automake watch mtr wget nmap bash bash-completion speedtest_cli aws-shell htop tmux unrar docker golang"
BREW_CASKS="chefdk iterm2-beta dropbox virtualbox java"

if [ ! -f ~/.brewhub ] ; then
    echo "\n\n"
    echo "You must reate a personal access token:"
    echo "https://github.com/settings/tokens/new?scopes=gist,public_repo&description=Homebrew"
    echo "Enter Github Token for Homebrew: "
    read github_key
    echo "export HOMEBREW_GITHUB_API_TOKEN='$github_key'" > ~/.brewhub
    source ~/.brewhub
fi

brew tap caskroom/versions
brew install $BREW_APPS
brew cask install $BREW_CASKS

sudo chown -R $(whoami) ~/.chefdk
eval "$(chef shell-init $SHELL)"

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

# GoLang
GO_PATH=$HOME/go
mkdir $GO_PATH

echo "Complete. Loading Z-Shell"
cd $HOME && zsh
