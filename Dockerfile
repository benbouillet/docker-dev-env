# Neovim full lua support build (see https://github.com/nvim-telescope/telescope.nvim/issues/2158#issuecomment-1237716752)
FROM ubuntu:22.04 AS nvim_builder
RUN apt-get update
RUN apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen git -y
RUN git clone https://github.com/neovim/neovim
WORKDIR /neovim
RUN git checkout stable
RUN make CMAKE_BUILD_TYPE=RelWithDebInfo
RUN make CMAKE_INSTALL_PREFIX=/root/local/nvim install

# DevOps image
FROM ubuntu:22.04

ARG USER=ben
ENV GROUP=${USER}
ENV HOME=/home/${USER}
ENV TMUX_SESSION_NAME=devops
ENV ZSH_TMUX_AUTOSTART=true
ENV ZSH_TMUX_UNICODE=true
ENV ZSH_TMUX_DEFAULT_SESSION_NAME=devops
ENV XDG_CONFIG_HOME=${HOME}/.config
ENV XDG_DATA_HOME=${HOME}/.local/share

RUN groupadd ${GROUP}
RUN useradd -m -g ${USER} ${GROUP}

RUN apt-get update -y && apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
RUN apt-get install -y \
	ca-certificates \
	curl \
	git \
	wget \
	docker \
	vim \
    fzf \
	zsh \
    fd-find \
    zsh-syntax-highlighting \
    tmux \
    locales \
    locales-all \
    python3 \
    pip
    # docker.io \
    # neovim \
    # luajit

RUN python3 -m pip install --user --upgrade pynvim

# Docker in Docker configuration
# RUN groupadd docker
# RUN usermod -aG docker ${USER}
# RUN touch /var/run/docker.sock
# RUN chown root:docker /var/run/docker.sock

RUN usermod -s /bin/zsh ${USER}

# Configuring locales
RUN ln -fs /usr/share/zoneinfo/Europe/Paris /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata

# kubectl
# RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/$(dpkg --print-architecture)/kubectl"
# RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

COPY --from=nvim_builder /root/local/nvim ${HOME}/local/nvim

RUN chown -R ${USER}:${GROUP} ${HOME}/.local

USER ${USER}
WORKDIR /home/${USER}

# Zsh configuration
# RUN mkdir -p ${HOME}/.antigen
# RUN mkdir -p ${HOME}/.zsh
# RUN curl -L git.io/antigen > ${HOME}/.antigen/antigen.zsh

# Oh-My-Zsh configuration
RUN wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O - | zsh || true

# ZSH plugins
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
# RUN git clone --depth=1 https://github.com/wbthomason/packer.nvim.git ${XDG_DATA_HOME}/nvim/site/pack/packer/start/packer.nvim
RUN echo $(ls -lha /home/ben/.local)
#RUN mkdir -p ${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/
RUN wget  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim  -P ${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/

COPY --chown=${USER}:${GROUP} zshrc ${HOME}/.zshrc
COPY --chown=${USER}:${GROUP} tmux.conf ${HOME}/.tmux.conf
COPY --chown=${USER}:${GROUP} init.vim ${HOME}/.config/nvim/
# COPY --chown=${USER}:${GROUP} antigenrc ${HOME}/.antigenrc
COPY --chown=${USER}:${GROUP} p10k.zsh ${HOME}/.p10k.zsh

RUN ${HOME}/.tmux/plugins/tpm/bin/install_plugins
RUN ${HOME}/local/nvim/bin/nvim +PlugInstall! +qa

ENTRYPOINT ["zsh"]
