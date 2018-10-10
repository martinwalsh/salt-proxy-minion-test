include .makefiles/ludicrous.mk
include .makefiles/docker-compose.mk

up::
	@sleep 3 # wait a bit for the docker container
	$(call log,launching rest application in browser)
	@open http://localhost:8000
	$(call log,starting a shell on the salt master)
	docker-compose exec salt /bin/sh
