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
# env
# ------------------------------------------------------
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
set -g theme_display_nvm yes
set -x FZF_LEGACY_KEYBINDINGS 0
set -x PATH $HOME/.rbenv/bin $PATH
set -x PATH /opt/homebrew/bin $PATH

# ------------------------------------------------------
# java
# ------------------------------------------------------
set -g fish_user_paths "/opt/homebrew/opt/openjdk/bin" $fish_user_paths
set -gx CPPFLAGS "-I/opt/homebrew/opt/openjdk/include"

# ------------------------------------------------------
# pyenv
# ------------------------------------------------------
pyenv init - | source

# ------------------------------------------------------
# rbenv
# ------------------------------------------------------
status --is-interactive; and source (rbenv init -|psub)

# ------------------------------------------------------
# imagemagick
# ------------------------------------------------------
set -g fish_user_paths "/opt/homebrew/opt/gnu-getopt/bin" $fish_user_paths

# ------------------------------------------------------
# function
# ------------------------------------------------------
function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t $history[1]; commandline -f repaint
        case "*"
            commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)[-1]
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
end

function rootname
  echo $argv | sed 's/\.[^.]*$//'
end

function webp2png
  set pngFileName (rootname $argv).png
  dwebp -o $pngFileName $argv
  echo converted to $pngFileName
end

function heic2png
  set pngFileName (rootname $argv).png
  magick convert $argv $pngFileName
  echo converted to $pngFileName
end

function mov2gif
  set gifFileName (rootname $argv).gif
  ffmpeg -i $argv -r 10 $gifFileName
  echo converted to $gifFileName
end

function svg2o
  set svgFileName (rootname $argv)_optimized.svg
  svgo $argv -o $svgFileName
  echo converted to $svgFileName
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/coolooky/google-cloud-sdk/path.fish.inc' ]; . '/Users/coolooky/google-cloud-sdk/path.fish.inc'; end
