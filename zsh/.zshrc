export ZDOTDIR=~/.zsh


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Zimfw
export ZIM_HOME=${ZDOTDIR}/.zim

zstyle ':zim:zmodule' use 'degit'
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://mirror.ghproxy.com/https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

# Initialize modules.
source ${ZIM_HOME}/init.zsh

# History
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=${ZDOTDIR}/.zsh_history

# Environment
export EDITOR=nvim
export PATH=$PATH:~/.local/bin


# alias
alias ls='lsd'
alias sl='lsd'
alias la='lsd -la'
alias lh='lsd -hAl'
alias ll='lsd -l'
alias l='lsd -l'

alias md='function _mkcd() { mkdir -p "$1" && cd "$1"; }; _mkcd'
alias rr='source ~/.zsh/.zshrc'
alias vv='nvim ~/.zsh/.zshrc'
alias clc='clear'
alias vim='nvim'

alias cd..='cd ..'
alias cd.='cd ..'

alias cdp='cd ../..'
alias cdpp='cd ../../..'


# App
eval "$(zoxide init zsh)"


# To customize prompt, run `p10k configure` or edit ~/.zsh/.p10k.zsh.
[[ ! -f ~/.zsh/.p10k.zsh ]] || source ~/.zsh/.p10k.zsh

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
