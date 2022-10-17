# define standard colors
ifneq (,$(findstring xterm,${TERM}))
	YELLOW       := $(shell tput -Txterm setaf 3)
	PURPLE       := $(shell tput -Txterm setaf 5)
	BLUE         := $(shell tput -Txterm setaf 6)
	RESET := $(shell tput -Txterm sgr0)
else
	YELLOW       := ""
	PURPLE       := ""
	BLUE         := ""
	RESET        := ""
endif

DOCKER_IMAGE_NAME ?= chesnovskii/hello-mr-badger
DOCKER_IMAGE_TAG ?= 1.1
APP ?= hello-mr-badger

default: help

build: ## Builds the deployment docker image for the linux amd64 platform.
	@echo "\n${PURPLE}Building the image:\n${RESET}"
	@docker build -t $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG) --platform linux/amd64 .

build-arm: ## Builds the deployment docker image for the linux arm64 platform.
	@echo "\n${PURPLE}Building the image:\n${RESET}"
	@docker build --build-arg GOARCH=arm64 -t $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG)-arm64 --platform linux/arm64 .

run: ## Runs container with the linux/amd64 platform.
	@echo "\n${BLUE}Running container...\n${RESET}"
	@docker run -tid --name ${APP} -p 8080:8080 $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG)

run-arm: ## Runs container with the linux/arm64 platform.
	@echo "\n${BLUE}Running container...\n${RESET}"
	@docker run -tid --name ${APP} -p 8080:8080 $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG)-arm64

push: ## Pushes container with the linux/amd64 platform to the repository.
	@echo "\n${YELLOW}Pushing container to the docker hub...\n${RESET}"
	@docker push $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG)

push-arm: ## Pushes container with the linux/arm64 platform to the repository.
	@echo "\n${YELLOW}Pushing container to the docker hub...\n${RESET}"
	@docker push $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG)-arm64

help: ## Show this help.
	@grep -e "^[a-zA-Z_-]*:" Makefile|awk -F'##' '{gsub(/[ \t]+$$/, "", $$1);printf "%-30s\t%s\n", $$1, $$2}'
