WORKSPACE ?= $(PWD)

up: ## Install and start project
	@make git-clone APPLICATION=api GIT_URL=git@github.com:fpasquet/worshop-graphql-server.git
	@docker-compose up -d

git-clone: ## Clones a repository into ./project directory
	@if [ -d "./projects/$(APPLICATION)" ]; then\
		echo "$(APPLICATION) is already there, skipped.";\
	else\
		git clone ${GIT_URL} ./projects/$(APPLICATION);\
	fi

.PHONY: install

.DEFAULT_GOAL := help
help:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-25s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
.PHONY: help
