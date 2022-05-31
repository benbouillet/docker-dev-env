FROM ubuntu:20.04

ENV USER=ben
ENV HOME=/home/${USER}

RUN useradd -m  ${USER}

RUN apt-get update -y && apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	ca-certificates \
	curl \
	git \
	wget \
	zsh \
	tzdata \
	docker \
	vim

# Configuring locales
RUN ln -fs /usr/share/zoneinfo/Europe/Paris /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata

# kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/$(dpkg --print-architecture)/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

USER ${USER}
WORKDIR /home/${USER}

# Zsh configuration
RUN mkdir -p ${HOME}/.antigen
RUN mkdir -p ${HOME}/.zsh
RUN curl -L git.io/antigen > ${HOME}/.antigen/antigen.zsh

# Oh-My-Zsh configuration
RUN wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O - | zsh || true
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${HOME}/.oh-my-zsh/themes/powerlevel10k

COPY zshrc ${HOME}/.zshrc
COPY antigenrc ${HOME}/.antigenrc
COPY p10k.zsh ${HOME}/.p10k.zsh

ENTRYPOINT ["zsh"]

