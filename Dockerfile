FROM ubuntu:20.04

ENV USER=ben

RUN useradd -m  ${USER}

RUN apt-get update -y && apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	ca-certificates \
	git \
	wget \
	zsh \
	tzdata \
	vim

RUN ln -fs /usr/share/zoneinfo/Europe/Paris /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata

USER ${USER}
WORKDIR /home/${USER}

RUN wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O - | zsh || true
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${HOME}/.oh-my-zsh/themes/powerlevel10k

COPY zshrc ${HOME}/.zshrc
COPY p10k.zsh ${HOME}/.p10k.zsh

ENTRYPOINT ["zsh"]

