# keisuke dotfile
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

PROMPT="%c/ %# "

# unalias gcc
bindkey -e
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# ------------------------------------------------------
# zshrc
# ------------------------------------------------------
fpath+=/opt/homebrew/share/zsh/site-functions
autoload -U promptinit; promptinit
zstyle :prompt:pure:execution_time color 196
zstyle :prompt:pure:git:branch color 202
zstyle :prompt:pure:path color 214
prompt pure
setopt SHARE_HISTORY

# ------------------------------------------------------
# zplug
# https://github.com/zplug/zplug
# ------------------------------------------------------
# export ZPLUG_HOME=/usr/local/opt/zplug
# source $ZPLUG_HOME/init.zsh
# zplug "lukechilds/zsh-nvm"

# Install plugins if there are plugins that have not been installed
# if ! zplug check --verbose; then
#   printf "Install? [y/N]: "
#   if read -q; then
#     echo; zplug install
#   fi
# fi

# Then, source plugins and add commands to $PATH
# zplug load --verbose

# ------------------------------------------------------
# command
# ------------------------------------------------------
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias his='history'
alias ws='webstorm'

# ------------------------------------------------------
# config
# ------------------------------------------------------
alias bashp='vim ~/.bash_profile'
alias bashrc='vim ~/.bashrc'
alias szsh='source ~/.zshrc'
alias tcnf='vim ~/.tmux.conf'
alias vimrc='vim ~/.vimrc'
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
alias glog='git log --oneline --graph'
alias gp='git push'
alias gr='git reset'
alias gs='git status'
alias gst='git stash'
alias gstk='git stash --keep-index'
alias gich='git fetch'

alias ghproj='open https://github.com/remotehour/remotehour/projects/2'

alias ghb='gh browse'
alias ghpris='gh pr view --json closingIssuesReferences'

# ------------------------------------------------------
# docker
# ------------------------------------------------------
alias dec='docker exec -it'
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

function dimgtags() {
  if [ -z "$1" ]; then
    echo "使用法: dgrepimage <検索文字列>"
    echo "例: dgrepimage d5a9fca065ea"
    echo "例: dgrepimage latest"
    return 1
  fi
  docker images --format "{{.ID}}\t{{.Repository}}:{{.Tag}}" | grep "$1"
}

# ------------------------------------------------------
# Node / Deno
# ------------------------------------------------------
export PATH="$PROTO_HOME:$PROTO_HOME/shims:$PROTO_HOME/tools/node/20.12.1/bin:$PATH"
export PATH="$PROTO_HOME:$PROTO_HOME/shims:$PROTO_HOME/tools/node/22.15.0/bin:$PATH"
export PATH="$HOME/.deno/bin:$PATH"

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

# ------------------------------------------------------
# Ruby
# ------------------------------------------------------
if command -v rbenv 1>/dev/null 2>&1; then
  alias be='bundle exec'

  export PATH=$PATH:$HOME/.rbenv/bin

  eval "$(rbenv init -)"
fi
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.3.0/bin:$PATH"

# ------------------------------------------------------
# Go
# ------------------------------------------------------
export GOPATH=$HOME/go
export PATH=$PATH:GOPATH

# ------------------------------------------------------
# Mojo
# ------------------------------------------------------
export MODULAR_HOME="$HOME/.modular"
export PATH="$MODULAR_HOME/pkg/packages.modular.com_mojo/bin:$PATH"

# ------------------------------------------------------
# Flutter
# ------------------------------------------------------
export PATH=$HOME/development/flutter/bin:$PATH

# ------------------------------------------------------
# gcloud
# ------------------------------------------------------
# ------------------------------------------------------
# Rust
# ------------------------------------------------------
# ------------------------------------------------------
# Java
# ------------------------------------------------------
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Javaのbrewインストール時に一緒に貼れと言われたが、CPPFLAGSは先に定義されてあったので、保留
# For compilers to find openjdk you may need to set:
# export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
alias epubcheck="java -jar ~/tools/epubcheck-5.2.1/epubcheck.jar"

# ------------------------------------------------------
# PostgreSQL
# ------------------------------------------------------
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# ------------------------------------------------------
# GCP
# ------------------------------------------------------
export PATH="$HOME/google-cloud-sdk/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# ------------------------------------------------------
# Proto
# ------------------------------------------------------
export PROTO_AUTO_INSTALL=true
export PROTO_AUTO_CLEAN=true

# ------------------------------------------------------
# mise
# ------------------------------------------------------
eval "$(mise activate --shims)"

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

# function bind_bang
#     switch (commandline -t)[-1]
#         case "!"
#             commandline -t $history[1]; commandline -f repaint
#         case "*"
#             commandline -i !
#     end
# end

# ------------------------------------------------------
# Functions
# ------------------------------------------------------
function itermhere() {
  open -a iTerm .
}
function ktmux() {
  local dir_name=$(basename "$PWD")
  local timestamp=$(date "+%Y%m%d%H%M%S")
  local session_name="${dir_name}-${timestamp}"

  tmux new-session -d -s "$session_name" \; \
    split-window -h \; \
    resize-pane -t 0 -x 20 \; \
    select-pane -t 1 \; \
    split-window -v \; \
    split-window -v \; \
    select-pane -t 0

  # 少し待ってからペインIDを取得
  sleep 0.3

  # ペイン一覧を取得（順番通り：main, pane1, pane2, pane3）
  local panes=($(tmux list-panes -t "$session_name" -F '#{pane_id}'))
  local main_pane="${panes[0]}"
  local task_panes=("${panes[@]:1}")  # 残りの3つ

  # 全ペインのIDを取得して "cc" を送る
  for pane_id in "${panes[@]}"; do
    tmux send-keys -t "$pane_id" "cc" Enter &
    sleep 0.1  # タイミング調整（なくてもOK）
  done
  wait  # 並列処理の終了を待つ

  sleep 1 # Claude Code の起動完了を待つ

  # 全ペインに "あなたは paneX" 命令を送る
  local i=1
  for pane_id in "${task_panes[@]}"; do
    local msg=$(cat <<EOF
あなたは pane$i です。mainパネルからタスクを受け取って処理してください。
エラー時は\"tmux send-keys -t %0\"で、[pane$i]のプレフィックスをつけて、mainパネルへ報告すること。
わかったら確認で「わかりました」と返事をtmux send-keysを使って送って
EOF
)
    tmux send-keys -t "$pane_id" "$msg"
    ((i++))
  done
  wait

  # セッションにアタッチ
  tmux attach-session -t "$session_name"
}
function rootname() {
  echo $argv | sed 's/\.[^.]*$//'
}

function webp2png() {
  set pngFileName (rootname $argv).png
  dwebp -o $pngFileName $argv
  echo converted to $pngFileName
}

function git-wta() {
  local branch="$1"
  if [[ -z "$branch" ]]; then
    echo "使い方: git wta <branch>"
    return 1
  fi

  local worktrees_dir=".worktrees"
  mkdir -p "$worktrees_dir"

  # ディレクトリ名はブランチ名をスラッシュ→ハイフンに置換
  local dir_name="${branch//\//-}"
  local full_path="$worktrees_dir/$dir_name"

  git worktree add "$full_path" "$branch"
  echo "✅ Worktree added at $full_path for branch '$branch'"
}

function jpg2webp() {
  set webpFileName (rootname $argv).webp
  ffmpeg -i $argv $webpFileName
  echo converted to $webpFileName
}

function svg2png() {
  set pngFileName (rootname $argv).png
  magick -density 100 $argv $pngFileName
  echo converted to $pngFileName
}

function mov2gif() {
  set gifFileName (rootname $argv).gif
  ffmpeg -i $argv -r 10 $gifFileName
  echo converted to $gifFileName
}

function webm2mp4() {
  set mp4FileName (rootname $argv).mp4
  ffmpeg -i $argv $mp4FileName
  echo converted to $mp4FileName
}

function mp423() {
  local mp3FileName="${1%.*}.mp3"
  local bitrate=${2:-128k}
  ffmpeg -i $1 -b:a $bitrate $mp3FileName
  echo converted to $mp3FileName at $bitrate
}

function svg2o() {
  set svgFileName (rootname $argv)_optimized.svg
  svgo $argv -o $svgFileName
  echo converted to $svgFileName
}

function dropboxconv() {
  string replace www.dropbox dl.dropboxusercontent $argv | string replace '?dl=0' ''
}

# ------------------------------------------------------
# etc
# ------------------------------------------------------
alias cc="claude --dangerously-skip-permissions"
alias ccc="claude --dangerously-skip-permissions --continue"
alias ctags="`brew --prefix`/bin/ctags"
alias tmuxks="tmux kill-session"
alias awscre="cat ~/.aws/credentials"

export TERM=screen-256color
export LANG=ja_JP.UTF-8
# export LDFLAGS="-L/opt/homebrew/lib"
# export CPPFLAGS="-I/opt/homebrew/include"
export LDFLAGS="-L/opt/homebrew/opt/zlib/lib"
export CPPFLAGS="-I/opt/homebrew/opt/zlib/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/zlib/lib/pkgconfig"

export JAVA_HOME="/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents"
export PATH="$JAVA_HOME/bin:$PATH"

export PATH="/opt/homebrew/opt/libomp/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# CCManager
# https://github.com/kbwo/ccmanager/tree/main
export CCMANAGER_CLAUDE_ARGS="--dangerously-skip-permissions"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# vim -> nvim
alias vim="nvim"

# Shopify Hydrogen alias to local projects
alias h2='$(npm prefix -s)/node_modules/.bin/shopify hydrogen'
eval "$(gh copilot alias -- zsh)"
