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

# zsh theme
ZSH_THEME="robbyrussell"

# zsh plugins
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
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

HIST_STAMPS="dd.mm.yyyy"
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Auto-completion
autoload -U compinit && compinit

# vi-mode
VI_MODE_SET_CURSOR=true

# aliases
alias k=kubectl
