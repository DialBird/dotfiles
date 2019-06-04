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

# ------------------------------------------------------
# zshrc
# ------------------------------------------------------
autoload -U promptinit; promptinit
prompt pure

# ------------------------------------------------------
# config
# ------------------------------------------------------
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
# python
# ------------------------------------------------------
if [ -x "$(command -v pyenv)" ]; then
  export PATH=$PATH:$HOME/.pyenv/bin
  eval "$(pyenv init -)"
fi

# ------------------------------------------------------
# ruby
# ------------------------------------------------------
export PATH=$PATH:$HOME/.rbenv/bin
eval "$(rbenv init -)"

# ------------------------------------------------------
# etc
# ------------------------------------------------------
alias be='bundle exec'
alias ctags="`brew --prefix`/bin/ctags"

# ------------------------------------------------------
# export
# ------------------------------------------------------
export TERM=screen-256color
export LANG=ja_JP.UTF-8
export PATH=$PATH:$HOME/.gem/ruby/2.5.0/bin:/usr/local/bundle/bin
export SLASHUB_PORT=3030
export PATH=$HOME/.nodebrew/current/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
