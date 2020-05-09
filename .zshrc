alias v=nvim
alias vi=nvim
alias vim=nvim
alias t="nvim ~/todo"
alias weather="curl v2.wttr.in/${1:-Vancouver} --silent | less -S -R -#3"
alias p="~/pipes.sh"

export ZSH="/Users/temp/.oh-my-zsh"

ZSH_THEME="gitster-zen"

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

sleep 0.4
fortune -s | cowsay -n -f hellokitty
echo
