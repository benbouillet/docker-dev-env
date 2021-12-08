FROM archlinux:base-devel

ENV USER=ben
ENV USER_HOME=/home/$USER

RUN pacman -Syu --noconfirm
RUN pacman -Sy --noconfirm git \
       wget \
       tmux \
       neovim \
       zsh

RUN useradd -m ${USER}

RUN usermod -aG wheel ${USER}
RUN echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# User
USER ${USER}

RUN mkdir -p $USER_HOME/dev
WORKDIR $USER_HOME

RUN wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O - | zsh || true
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
RUN git clone https://github.com/zsh-users/zsh-autosuggestions $USER_HOME/.oh-my-zsh/plugins/zsh-autosuggestions
# Copy zsh config
COPY p10k.zsh $USER_HOME/.p10k.zsh
COPY zshrc  $USER_HOME/.zshrc
COPY tmux.conf

WORKDIR $USER_HOME/dev

# # Install Vim
# RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# COPY init.vim ${HOME}/.config/nvim/init.vim
# RUN nvim +PlugInstall +qall

# # Install TMUX
# COPY tmux.conf ${HOME}/.tmux.conf
# RUN git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
# RUN ${HOME}/.tmux/plugins/tpm/bin/install_plugins

# # Entrypoint script creates a user called `me` and `chown`s everything
# COPY entrypoint.sh /bin/entrypoint.sh

# # Set working directory to /workspace
# WORKDIR /workspace

# # Default entrypoint, can be overridden
# CMD ["/bin/entrypoint.sh"]


# Setup my $SHELL
ENV SHELL /bin/zsh