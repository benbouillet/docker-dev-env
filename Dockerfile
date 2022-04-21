FROM ubuntu:20.04

ENV USER=ben
ENV HOME_DIR=/home/${USER}

RUN useradd -m  ${USER}

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y \
	git \
	wget \
	zsh \
	vim

USER ${USER}
WORKDIR /home/${USER}

RUN wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O - | zsh || true
# RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${HOME}/.oh-my-zsh/themes/powerlevel10k

COPY zshrc ${HOME_DIR}/.zshrc
# COPY p10k.zsh ${HOME_DIR}/.p10k.zsh

ENTRYPOINT ["zsh"]

