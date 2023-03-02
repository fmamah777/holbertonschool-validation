help: ## showing help documentation
	fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
build: ## Generate the website from the markdown and config file in dist
	hugo

clean: ## Clean up the content in dist
	rm -rf dist/*
check: ## Check

validate: ## Validate

test: ## Test

unit-tests: ## Test

lint: ## Lint

stop: ## Stop

integration-tests: ## Test

run: ## Run

Workflow: ## Workflow

post: ## Post the website
	hugo new posts/$(POST_NAME).md
	sed -i '2s/title: .*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md >/dev/null 2>&1