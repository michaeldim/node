CURRENT_DIRECTORY := $(shell pwd)
NAME = michaeldim/node
TAG = $$(git log -1 --pretty=format:%h)
IMG = $(NAME):$(TAG)
LATEST = $(NAME):latest

build:
	@docker build -t $(IMG) $(CURRENT_DIRECTORY)
	@docker tag $(IMG) $(LATEST)

build-no-cache:
	@docker build -t $(IMG) --no-cache $(CURRENT_DIRECTORY)
	@docker tag $(IMG) $(LATEST)

push:
	@docker push $(NAME)

login:
  @docker log -u ${DOCKER_USER} -p ${DOCKER_PASS}

.PHONY: build build-no-cache push login