FROM ubuntu:20.04

ENV USER=ben
ENV HOME_DIR=/root


RUN adduser -D ${USER}
RUN mkdir -p /app \
    && chown -R main:main /app

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

RUN wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O - | zsh || true
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.oh-my-zsh/themes/powerlevel10k
COPY zshrc ${HOME_DIR}/.zshrc
COPY p10k.zsh ${HOME_DIR}/.p10k.zsh

RUN ln -f /bin/zsh /bin/sh

ENTRYPOINT ["zsh"]
