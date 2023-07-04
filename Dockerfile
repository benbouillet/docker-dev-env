FROM ubuntu:22.04 AS builder

ENV LAZYGIT_VERSION=0.38.2

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
        git \
        curl \
        unzip \
        ninja-build \
        gettext \
        libtool \
        libtool-bin \
        autoconf \
        automake \
        cmake \
        g++ \
        pkg-config \
        python3-dev \
        liblua5.4-dev \
        libluajit-5.1-dev

# Clone neovim repo and checkout stable tag
RUN git clone --depth=1 --branch=stable https://github.com/neovim/neovim.git /neovim
WORKDIR /neovim
RUN make CMAKE_BUILD_TYPE=RelWithDebInfo && make install

# Getting Lazy-git
WORKDIR /lazygit
RUN curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_arm64.tar.gz"
RUN tar xf lazygit.tar.gz lazygit

FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
        build-essential \
        fd-find \
        ripgrep \
        git

# Copy Neovim and Packer from previous stage
COPY --from=builder /usr/local/bin/nvim /usr/local/bin/nvim
COPY --from=builder /usr/local/share/nvim/ /usr/local/share/nvim/

# Copy binaries
COPY --from=builder /lazygit/lazygit /tmp/
RUN install /tmp/lazygit /usr/local/bin

# Copy configuration files
COPY neovim /root/.config/nvim/

# Install plugins headlessly
RUN nvim --headless "+Lazy sync" +qall

CMD ["/bin/bash", "-c", "nvim"]
# CMD ["/bin/bash"]
