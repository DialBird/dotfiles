#!/bin/bash

set -eu

readonly DOT_FILES=(.bashrc .vimrc .vimrc_dein .tmux.conf .zshrc .zpreztorc .zprofile)

for file in ${DOT_FILES[@]}; do
  if grep -s 'keisuke docker dotfiles' $HOME/$file; then
    echo "$file is skipped"
    continue
  fi

  if [[ -e $HOME/$file ]]; then
    cat $HOME/docker_dotfiles/$file >> $HOME/$file
    echo "$file is added"
  else
    ln -s $HOME/docker_dotfiles/$file $HOME/$file
    echo "$file is linked"
  fi
done

cat <<EOS

task completed!
EOS
