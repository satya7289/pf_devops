restart:
	docker-compose up -d --force-recreate --remove-orphans && docker image prune