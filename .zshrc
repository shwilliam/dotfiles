alias vi=nvim
alias vim=nvim

alias day="osascript -e 'tell application \"Finder\" to set desktop picture to POSIX file \"/Users/shwilliam/Pictures/wallpapers/day.png\"'"

alias night="osascript -e 'tell application \"Finder\" to set desktop picture to POSIX file \"/Users/shwilliam/Pictures/wallpapers/night.jpg\"'"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export ZSH="/Users/shwilliam/.oh-my-zsh"
# export PATH=$HOME/bin:/usr/local/bin:$PATH

ZSH_THEME="lambda-gitster"
# DISABLE_LS_COLORS="true"

HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
# DISABLE_AUTO_TITLE="true"

# uncomment if pasting URLs or other text is weird
# DISABLE_MAGIC_FUNCTIONS=true

# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd" or
# custom format using strftime fn format spec
# HIST_STAMPS="mm/dd/yyyy"

# DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"

# plugins found in ~/.oh-my-zsh/plugins/*
# custom plugins added to ~/.oh-my-zsh/custom/plugins/
plugins=(git npm extract zsh-z zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
# export LANG=en_US.UTF-8
export EDITOR='nvim'

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

