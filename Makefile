
CURDIR_NAME = $(shell basename ${CURDIR})
COMPOSE_NETWORK_NAME = $(shell echo $(strip $(subst -,, ${CURDIR_NAME}_default)| tr  A-Z a-z ))
TEST_SUITE := "dev"

selenium:
	docker-compose up -d selenium

clean:
	docker-compose down	

setup: 
	docker-compose build; \
	docker-compose pull selenium; 

test: selenium run_tests clean

run_tests:
	rm -Rf ./results;
	mkdir ./results; \
	docker run --net=${COMPOSE_NETWORK_NAME} -t -e SELENIUM_HOSTNAME=selenium \
	   -v "$$(pwd)/results:/opt/tests/build/" tests bash -c "./run_tests.sh"; \
	exitStatus=$$?;

debug:
	echo ${COMPOSE_NETWORK_NAME} 

.PHONY: test
	run_tests \
	selenium \
	test \