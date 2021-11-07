FROM archlinux:base-20210822.0.32033

ENV USER=ben
ENV HOME_DIR=/root

RUN useradd ${USER}
RUN mkdir -p /dev \
    && chown -R ${USER}:${USER} /dev

RUN pacman -Syu --noconfirm
RUN pacman -Sy --noconfirm git=2.33.1-1 \
       wget=1.21.2-1 \
       zsh=5.8-1

RUN wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O - | zsh || true
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.oh-my-zsh/themes/powerlevel10k
COPY zshrc ${HOME_DIR}/.zshrc
COPY p10k.zsh ${HOME_DIR}/.p10k.zsh

RUN ln -f /bin/zsh /bin/sh

USER ${USER}

ENTRYPOINT ["zsh"]
