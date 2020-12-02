# ------------------------------------------------------
# Alias
# ------------------------------------------------------
alias fishrc='vim ~/.config/fish/config.fish'
alias his='history'
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias sfish='source ~/.config/fish/config.fish'
alias tcnf='vim ~/.tmux.conf'
alias vim="nvim"
alias vimrc='vim ~/.vimrc'
alias vimrd='vim ~/.vimrc_dein'

# Git
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
alias gich='git fetch'

# Docker
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
# pyenv
# ------------------------------------------------------
pyenv init - | source

# ------------------------------------------------------
# rbenv
# ------------------------------------------------------
status --is-interactive; and source (rbenv init -|psub)


# ------------------------------------------------------
# env
# ------------------------------------------------------
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
set -g theme_display_nvm yes
