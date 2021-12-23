USER=defaultuser
DOCKER_TAG=v1.0
# Makefile
help:
	@echo "Commands:"
	@echo "build          : build the docker container from the Dockerfile."
	@echo "run            : start the pytest unit tests campaign."

# Docker container build Archlinux
build-archlinux:
	docker build -t dev-env:${DOCKER_TAG} -f archlinux/Dockerfile --build-arg USER=${USER} .

# Docker container build Ubuntu
build-ubuntu:
	docker build -t dev-env:${DOCKER_TAG} -f ubuntu/Dockerfile --build-arg USER=${USER} .

# Docker container run
.PHONY: run
run:
	docker run -it dev-env:${DOCKER_TAG} tmux
