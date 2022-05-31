# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Antigen plugin manager
source $HOME/.antigen/antigen.zsh
source $HOME/.antigenrc

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="dd.mm.yyyy"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git colorize github docker docker-compose autodotenv kubectl)

# Auto-completion
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

alias k=kubectl

POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ${HOME}/.p10k.zsh ]] || source ${HOME}/.p10k.zsh

