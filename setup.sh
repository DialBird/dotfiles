#!/bin/bash

set -eu

DOT_FILES=(.bashrc .vimrc .vimrc_dein .tmux.conf)

for file in ${DOT_FILES[@]}; do
  ln -s $HOME/dotfiles/$file $HOME/$file
done
