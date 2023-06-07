FROM ubuntu:22.04 AS builder

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

FROM ubuntu:22.04

# Copy Neovim and Packer from previous stage
COPY --from=builder /usr/local/bin/nvim /usr/local/bin/nvim
COPY --from=builder /usr/local/share/nvim/ /usr/local/share/nvim/


# Install dependencies
RUN apt-get update && \
    apt-get install -y \
#         liblua5.4-0 \
#         libluajit-5.1-2 \
        ripgrep \
        git

# Copy configuration files
COPY neovim /root/.config/nvim/

# Install plugins headlessly
RUN nvim --headless "+Lazy! sync" +qall

CMD ["/bin/bash", "-c", "nvim"]
