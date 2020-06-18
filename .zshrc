# keisuke dotfiles
#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# unalias gcc
bindkey -e
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# ------------------------------------------------------
# zshrc
# ------------------------------------------------------
autoload -U promptinit; promptinit
prompt pure
setopt SHARE_HISTORY

# ------------------------------------------------------
# command
# ------------------------------------------------------
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias his='history'

# ------------------------------------------------------
# config
# ------------------------------------------------------
alias bashp='vim ~/.bash_profile'
alias bashrc='vim ~/.bashrc'
alias szsh='source ~/.zshrc'
alias tcnf='vim ~/.tmux.conf'
alias vimrc='vim ~/.vimrc'
alias vimrd='vim ~/.vimrc_dein'
alias zprec='vim ~/.zpreztorc'
alias zshrc='vim ~/.zshrc'

# ------------------------------------------------------
# git
# ------------------------------------------------------
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gca='git commit --amend'
alias gch='git checkout'
alias gchp='git cherry-pick'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log'
alias gp='git push'
alias gr='git reset'
alias gs='git status'
alias gst='git stash'
alias gstk='git stash --keep-index'
alias gich='git fetch'

# ------------------------------------------------------
# docker
# ------------------------------------------------------
alias dec='docker exec -it'
alias dimgs='docker images'
alias dp='docker ps --format "table {{.Names}}\t{{.Ports}}"'
alias dpa='dp -a'
alias dr='docker run --name'
alias drm='docker rm'
alias drmi='docker rmi'
alias dst='docker start'
alias dstp='docker stop'
alias doc='docker-compose'
alias docb='docker-compose build'
alias doce='docker-compose exec'
alias docr='docker-compose run'

# ------------------------------------------------------
# Node
# ------------------------------------------------------
export PATH=$PATH:$HOME/.nodebrew/current/bin

# ------------------------------------------------------
# PHP
# ------------------------------------------------------
alias cdmamp='cd /Applications/MAMP/htdocs'
export PATH=$PATH:/Applications/MAMP/Library/bin

export PHP_VERSION=7.4.2
export PATH=/Applications/MAMP/bin/php/php$PHP_VERSION/bin:$PATH

# ------------------------------------------------------
# Python
# ------------------------------------------------------
if command -v pyenv 1>/dev/null 2>&1; then
  export PATH=$PATH:$HOME/.pyenv/bin

  eval "$(pyenv init -)"
fi

# ------------------------------------------------------
# Ruby
# ------------------------------------------------------
if command -v pyenv 1>/dev/null 2>&1; then
  alias be='bundle exec'

  export PATH=$PATH:$HOME/.rbenv/bin

  eval "$(rbenv init -)"
fi

# ------------------------------------------------------
# gcloud
# ------------------------------------------------------
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dialbird/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/dialbird/google-cloud-sdk/path.zsh.inc'; fi

# ------------------------------------------------------
# Suffix Aliases
# ------------------------------------------------------
function with_echo() {
  echo $@
  $@
}
function cpp_compile() {
  with_echo g++ -std=c++14 -g -O0 -o $1 $2
}
function cpp_run() {
  cpp_file=$1
  exe_file=${cpp_file:0:-4}
  shift

  if [ -s $cpp_file ]; then
    if [ ! -f $exe_file ]; then
      cpp_compile $exe_file $cpp_file && ./$exe_file $@
    else
      cpp_date=`date -r $cpp_file +%s`
      exe_date=`date -r $exe_file +%s`
      if [ $cpp_date -gt $exe_date ]; then
        cpp_compile $exe_file $cpp_file && ./$exe_file $@
      else
        ./$exe_file $@
      fi
    fi
  else
    echo $cpp_file is empty
  fi
}
alias -s cpp=cpp_run
alias -s py=python
alias -s rb=ruby

# ------------------------------------------------------
# etc
# ------------------------------------------------------
alias ctags="`brew --prefix`/bin/ctags"

export TERM=screen-256color
export LANG=ja_JP.UTF-8

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
