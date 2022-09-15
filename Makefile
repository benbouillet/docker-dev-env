SHELL = /bin/bash

# Makefile
help:
	@echo "Commands:"
	@echo "build       : Build the docker-dev-env image locally"
	@echo "brun        : Build & Run the image"
	@echo "run         : Run the image in interactive mode"

build:
	docker build -t docker-env-dev .

run:
	@docker run -e TERM -e COLORTERM -it docker-env-dev $(call args,)

brun: build
	@docker run -e TERM -e COLORTERM -it docker-env-dev $(call args,)
