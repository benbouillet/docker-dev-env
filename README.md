# Personal Environment Docker Image

## Links
* [Setting up ZSH in Docker](https://dev.to/arctic_hen7/setting-up-zsh-in-docker-263f)
* [ZSH configuration for nice Docker shells in Alpine](https://gist.github.com/arctic-hen7/bbfcc3021f7592d2013ee70470fee60b)
* [This allows an instance of the IDE per project](https://github.com/ls12styler/ide)
* [Why non-root containers are important for security](https://engineering.bitnami.com/articles/why-non-root-containers-are-important-for-security.html)
* [dev-in-a-box/Dockerfile](https://github.com/darxkies/dev-in-a-box/blob/master/Dockerfile)
* [Install Zsh, Oh-My-Zsh and plugins inside a Docker container with one line!](https://reposhub.com/linux/system-utilities/deluan-zsh-in-docker.html)
* [zsh-in-docker/zsh-in-docker.sh](https://github.com/deluan/zsh-in-docker/blob/master/zsh-in-docker.sh)
* [powerlevel10k/powerlevel10k.zsh-theme](https://github.com/romkatv/powerlevel10k/blob/master/powerlevel10k.zsh-theme)
* [Processes In Containers Should Not Run As Root](https://medium.com/@mccode/processes-in-containers-should-not-run-as-root-2feae3f0df3b)
* [Docker security](https://docs.docker.com/engine/security/)
* [Vim As an IDE for Python 2021](https://medium.com/nerd-for-tech/vim-as-an-ide-for-python-2021-f922da6d2cfe)
* [Production-ready Docker packaging for Python developers](https://pythonspeed.com/docker/)

## TODO

- [x] Oh My Zsh
- [x] Oh-my zsh plugins
- [x] locales
- [x] Management of user/group and permissions
- [ ] Powerlevel10k
- [ ] tmux
- [ ] easymotion for zsh
- [ ] colors in zsh
- [ ] Vim + Plugin Manager (Vundle ?)

## Usage
```sh
docker build -t <image_name>:<tag> --build-arg USER=<user> .
```

```sh
docker run -it -n <container_name> <image_name>:<tag>
```
