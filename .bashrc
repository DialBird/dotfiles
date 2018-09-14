# keisuke docker dotfiles
#
# ------------------------------------------------------
# config
# ------------------------------------------------------
alias vimrc='vim ~/.vimrc'
alias vimrd='vim ~/.vimrc_dein'
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

# ------------------------------------------------------
# etc
# ------------------------------------------------------
alias be='bundle exec'

# ------------------------------------------------------
# export
# ------------------------------------------------------
export TERM=screen-256color
export LANG=ja_JP.UTF-8
export PATH=$PATH:$HOME/.gem/ruby/2.5.0/bin:/usr/local/bundle/bin
