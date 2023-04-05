lint:		## Lint
	golangci-lint run

build: lint	## Build
	go build

run:		## Run
	./awesome-api > ./awesome.log 2>&1 &

stop:		## Stop
	kill $$(pgrep awesome-api) 2>&1 &

clean: stop		## Clean
	rm -f ./awesome-api
	rm -f ./awesome.log
	rm -f ./coverage-units.out
	rm -f ./coverage-integrations.out

test: unit-tests integration-tests ## Test

unit-tests:	## Unit Tests
	go test -v -short -coverprofile=coverage-units.out

integration-tests: ## Integration Tests
	go test -v -short -coverprofile=coverage-integrations.out

help:		## Help
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done
