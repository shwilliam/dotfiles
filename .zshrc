# functions
function runvim() {
  if [ $# -eq 0 ] 
  then
    command nvim -o `fzf`
  else
    command nvim "$@"
  fi
}

function current_time() {
  echo "$(date +'%H:%M:%S') $(emoji-clock)"
}

function welcome() {
  echo "It's $(date +'%A, %b %d')\n at $(current_time)" | cowsay -n -f hellokitty
  echo
}

# ls on navigate
function chpwd() {
  # run after cd
  emulate -L zsh
  clear
  current_time
  ls -aC
  echo
}

function checkweather() {
  if [ $# -eq 0 ]
  then
    local CITY=Vancouver
  else
    local CITY=$@
  fi
  command curl v2.wttr.in/$CITY --silent | less -S -R -#3
}

# plugins
source ~/.zsh/zsh-interactive-cd.plugin.zsh
source ~/.zsh/emoji-clock.plugin.zsh
# clone `zsh-users/zsh-autosuggestions`
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# clone `olivierverdier/zsh-git-prompt`
source ~/.zsh/zsh-git-prompt/zshrc.sh

# sane defaults

HISTSIZE=10000
SAVEHIST=10000
FZF_DEFAULT_COMMAND="rg --files --hidden --follow -g '!{node_modules,.git,dist,build,.cache,.next}'"

autoload -U colors && colors
autoload -U promptinit && promptinit
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

setopt auto_cd
setopt multios
setopt prompt_subst

setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

# (neo)vim
export EDITOR='nvim'

alias v=runvim
alias vi=runvim
alias vim=runvim

# misc
alias weather=checkweather
alias pipes="~/pipes.sh"
alias fetch=neofetch

# yabai
alias wmstop="brew services stop yabai"
alias wmstart="brew services start yabai"
alias wmrestart="brew services restart yabai"

# prompt
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}[%{$fg[yellow]%}%{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}%b ("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"$'\n'"%# "
PROMPT='$(git_super_status)'

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# android studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

welcome
