#!/bin/bash

set -eu

DOT_FILES=(.bashrc .vimrc .vimrc_dein .tmux.conf)

for file in ${DOT_FILES[@]}; do
  if [[ -e $HOME/$file ]]; then
    cat $HOME/docker_dotfiles/$file >> $HOME/$file
  else
    ln -s $HOME/docker_dotfiles/$file $HOME/$file
  fi
done

echo 'completed'
