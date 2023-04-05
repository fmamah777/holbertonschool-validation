build:		## Build
	go build

run:		## Run
	./awesome-api > ./awesome.log 2>&1 &

stop:		## Stop
	kill $$(pgrep awesome-api)

clean: stop		## Clean
	rm ./awesome-api
	rm ./awesome.log

test:		## Test
	curl http://localhost:9999
	curl http://localhost:9999/health

help:		## Help
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done
