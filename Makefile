DOCKER_IMAGE ?= punumflutes/be

AWS_ACCOUNT_ID = 815345612430
ECR=$(AWS_ACCOUNT_ID).dkr.ecr.ap-south-1.amazonaws.com

ecr_login:
	aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin $(ECR)

pull_image:ecr_login
	docker pull $(ECR)/$(DOCKER_IMAGE)

restart:
	docker-compose up -d --force-recreate --remove-orphans && docker image prune	

