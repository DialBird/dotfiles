# keisuke dotfiles
#
# ------------------------------------------------------
# config
# ------------------------------------------------------
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias bashp='vim ~/.bash_profile'
alias sbash='source ~/.bashrc'
alias tcnf='vim ~/.tmux.conf'

# ------------------------------------------------------
# command
# ------------------------------------------------------
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias his='history'
alias cd_h='cd /var/www/html'

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

# ------------------------------------------------------
# pyenv
# ------------------------------------------------------
if [ -x "$(command -v pyenv)" ]; then
  export PATH=$PATH:$HOME/.pyenv/bin
  eval "$(pyenv init -)"
fi

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
export PATH=$HOME/.nodebrew/current/bin:$PATH

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# rbenv
export PATH=$PATH:$HOME/.rbenv/bin
eval "$(rbenv init -)"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
. "$HOME/.cargo/env"

# Shopify Hydrogen alias to local projects
alias h2='$(npm prefix -s)/node_modules/.bin/shopify hydrogen'