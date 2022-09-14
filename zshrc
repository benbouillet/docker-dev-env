# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# fzf config
export DISABLE_FZF_KEY_BINDINGS="true"
export FZF_BASE=/usr/bin/fzf

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
  github
  docker
  docker-compose
  dotenv
  ansible # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/ansible
  aws # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/aws
  branch # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/branch
  colored-man-pages # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/colored-man-pages
  fzf # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fzf
  gcloud # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/gcloud
  gitfast # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/gitfast
  gitignore # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/gitignore
  helm # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/helm
  history # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/history
  isodate # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/isodate
  kubectx # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/kubectx
  kubectl # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/kubectl
  terraform # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/terraform
  tmux # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux
  vi-mode # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vi-mode
)

source $ZSH/oh-my-zsh.sh

HIST_STAMPS="dd.mm.yyyy"
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Auto-completion
# autoload -U compinit && compinit

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# vi-mode
VI_MODE_SET_CURSOR=true

# Zsh syntax highlighting installation
source ${HOME}/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
