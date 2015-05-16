#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# setup ohmyzsh
if [ ! -d ~/.oh-my-zsh ]; then
    wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
fi


# setup ohmyzsh plugins
sed -i "s/plugins=(git)/plugins=(git fabric)/" $ZSHRC

echo To enable zsh for the current user run:
echo sudo chsh -s /bin/zsh $USER

