alias v=nvim
alias vi=nvim
alias vim=nvim
alias todo="nvim ~/todo"

# mongo
alias mongod="brew services start mongodb-community"
alias mongod-stop="brew services stop mongodb-community"

export ZSH="/Users/shwilliam/.oh-my-zsh"

ZSH_THEME="gitster"

# DISABLE_LS_COLORS="true"

HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# plugins found in ~/.oh-my-zsh/plugins/*
# custom plugins added to ~/.oh-my-zsh/custom/plugins/
plugins=(git npm extract zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
# export LANG=en_US.UTF-8
export EDITOR='nvim'

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

function chpwd() {
  # run after cd
  emulate -L zsh
  ls -a
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PATH="${PATH}:${HOME}/Library/Python/3.7/bin"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

function bg {
  local WALLPAPER_DIR="$HOME/Pictures/desktop"
  local WALLPAPER=$(find $WALLPAPER_DIR -type f -maxdepth 1 | shuf -n1)

  # local CURRENT_WALLPAPER="$(osascript -e 'tell app "finder" to get posix path of (get desktop picture as alias)')"

  osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$WALLPAPER\""

  wal -i $WALLPAPER -n -l
  brew services restart yabai
}

function paint {
  local CURRENT_WALLPAPER="$(osascript -e 'tell app "Finder" to get posix path of (get desktop picture as alias)')"
  wal -i $CURRENT_WALLPAPER -n -l
}

paint

