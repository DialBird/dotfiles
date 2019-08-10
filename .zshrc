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
setopt SHARE_HISTORY

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
# python
# ------------------------------------------------------
if command -v pyenv 1>/dev/null 2>&1; then
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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/dialbird/.pyenv/versions/anaconda3-5.3.0/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/dialbird/.pyenv/versions/anaconda3-5.3.0/etc/profile.d/conda.sh" ]; then
        . "/Users/dialbird/.pyenv/versions/anaconda3-5.3.0/etc/profile.d/conda.sh"
    else
        export PATH="/Users/dialbird/.pyenv/versions/anaconda3-5.3.0/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

