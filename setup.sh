#!/bin/bash

set -eu

readonly DOT_FILES=(.bashrc .gitconfig .git_template .vimrc .vimrc_dein .tmux.conf .zshrc .zpreztorc .zprofile .ideavimrc)

for file in ${DOT_FILES[@]}; do
  if grep -s 'keisuke dotfiles' $HOME/$file; then
    echo "$file is skipped"
    continue
  fi

  if [[ -e $HOME/$file ]]; then
    cat $HOME/dotfiles/$file >> $HOME/$file
    echo "$file is added"
  else
    ln -s $HOME/dotfiles/$file $HOME/$file
    echo "$file is linked"
  fi
done

cat <<EOS

task completed!
EOS
