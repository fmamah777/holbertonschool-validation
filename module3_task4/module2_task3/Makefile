.SILENT:
help: ## implemente and print a list of all the goals
	fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

build: ## Compiles the source code
	make lint && go build || exit -1

run: ## Runs the application in background
	./awesome-api >./awesome.log 2>&1 &

stop: ## Stops the application
	@kill $(shell pgrep awesome-api) 2>&1 &

clean: ## Delete
	make stop
	rm -r awesome-api 2>&1 &
	rm -r awesome.log 2>&1 &
	rm -r coverage-integrations.out
	rm -r coverage-units.out

test: ## Tests the application
	make unit-tests
	make unit-tests

lint: ## make lint on the files
	golangci-lint run

unit-tests: ## make unit tests on the files
	go test -v -short -coverprofile=coverage-units.out || echo $1

integration-tests: ## make unit tests on the files
	go test -v -run ^main_integration_test.go -coverprofile=coverage-integrations.out || echo $1