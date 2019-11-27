alias v=nvim
alias vi=nvim
alias vim=nvim
alias t=tmuxinator
alias todo="nvim ~/todo"

export ZSH="/Users/shwilliam/.oh-my-zsh"

ZSH_THEME="gitster-zen"
# DISABLE_LS_COLORS="true"

HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# plugins found in ~/.oh-my-zsh/plugins/*
# custom plugins added to ~/.oh-my-zsh/custom/plugins/
plugins=(git npm extract zsh-z zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
# export LANG=en_US.UTF-8
export EDITOR='nvim'

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

function chpwd() {
  # run after cd
  emulate -L zsh
  ls -a
}

alias day="osascript -e 'tell application \"Finder\" to set desktop picture to POSIX file \"/Users/shwilliam/Pictures/wallpapers/day.png\"'"
alias night="osascript -e 'tell application \"Finder\" to set desktop picture to POSIX file \"/Users/shwilliam/Pictures/wallpapers/night.png\"'"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
