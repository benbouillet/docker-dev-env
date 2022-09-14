FROM ubuntu:22.04

ARG USER=ben
ENV GROUP=${USER}
ENV HOME=/home/${USER}

RUN groupadd ${GROUP}

RUN useradd -m -g ${GROUP} ${USER}

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
    locales-all

# Configuring locales
RUN ln -fs /usr/share/zoneinfo/Europe/Paris /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata

# kubectl
# RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/$(dpkg --print-architecture)/kubectl"
# RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

USER ${USER}
WORKDIR /home/${USER}

# Zsh configuration
# RUN mkdir -p ${HOME}/.antigen
# RUN mkdir -p ${HOME}/.zsh
# RUN curl -L git.io/antigen > ${HOME}/.antigen/antigen.zsh

# Oh-My-Zsh configuration
RUN wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O - | zsh || true
# RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# ZSH syntax highlighting installation
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.config/zsh-syntax-highlighting

COPY --chown=${USER}:${GROUP} zshrc ${HOME}/.zshrc
# COPY --chown=${USER}:${GROUP} antigenrc ${HOME}/.antigenrc
# COPY --chown=${USER}:${GROUP} p10k.zsh ${HOME}/.p10k.zsh

ENTRYPOINT ["zsh"]

