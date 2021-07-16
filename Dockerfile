FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y software-properties-common=0.98.9.5
RUN add-apt-repository -y ppa:neovim-ppa/stable
RUN apt-get update
RUN apt-get install -y \
        python3-dev python3-pip \
        neovim=0.4.4-1~ubuntu20.04.1~ppa1 \
        curl=7.68.0-1ubuntu2.5 \ 
        tmux=3.0a-2ubuntu0.3 \
        git=1:2.25.1-1ubuntu3.1 \
        zsh=5.8-3ubuntu1 \
        wget=1.20.3-1ubuntu1

ENV HOME /root

# Install kubectl
RUN curl -LO https://dl.k8s.io/release/v1.21.0/bin/linux/amd64/kubectl
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install Vim
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
COPY init.vim ${HOME}/.config/nvim/init.vim
RUN nvim +PlugInstall +qall

# In the entrypoint, we'll create a user called `me`
WORKDIR ${HOME}

# Setup my $SHELL
ENV SHELL /bin/zsh

# Install oh-my-zsh
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.1/zsh-in-docker.sh)" -- \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions
# RUN wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O - | zsh || true
# RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${HOME}/.oh-my-zsh/plugins/zsh-autosuggestions
# Copy ZSh config
COPY p10k.zsh ${HOME}/.p10k.zsh
COPY zshrc ${HOME}/.zshrc

# Install TMUX
COPY tmux.conf ${HOME}/.tmux.conf
RUN git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
RUN ${HOME}/.tmux/plugins/tpm/bin/install_plugins

# Entrypoint script creates a user called `me` and `chown`s everything
COPY entrypoint.sh /bin/entrypoint.sh

# Set working directory to /workspace
WORKDIR /workspace

# Default entrypoint, can be overridden
CMD ["/bin/entrypoint.sh"]
