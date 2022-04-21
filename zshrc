# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="pygmalion"
# ZSH_THEME="agnoster"
ZSH_THEME="powerlevel10k/powerlevel10k"
#
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colorize github virtualenv pip python docker docker-compose)
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

alias py=python3
alias k=kubectl
alias xargs='xargs '

POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

bindkey -v
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Vi-mode display
# function zle-line-init zle-keymap-select {
#    RPS1="${${KEYMAP/vicmd/ [NORMAL]}/(main|viins)/ [INSERT]}"
#    RPS2=$RPS1
#    zle reset-prompt
# }

zle -N zle-line-init
zle -N zle-keymap-select

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
print 'going to source ~/.p10k.zsh; press enter to continue'
[[ ! -f /root/.p10k.zsh ]] || source /root/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ben/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ben/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/ben/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ben/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /Users/ben/Installs/terraform terraform

# Automate conda deactivate/activate
# prints the input
function condactivate() {
    conda deactivate
    conda deactivate
    conda activate $1
    echo 'Conda environment' $1 'activated'
}
# Auto-completion
autoload -U compinit && compinit
