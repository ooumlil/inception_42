.PHONY: build logs up up_d up_build down downv prune

build:
	docker-compose -f ./srcs/docker-compose.yml build --force-recreate

logs:
	docker-compose -f ./srcs/docker-compose.yml logs

up:
	docker-compose -f ./srcs/docker-compose.yml up

up_build:
	docker-compose -f ./srcs/docker-compose.yml up --build --force-recreate

down:
	docker-compose -f ./srcs/docker-compose.yml down

downv:
	docker-compose -f ./srcs/docker-compose.yml down -v

prune:
	docker image ls | awk '{ if($2 != "buster" && $2 != "TAG") print $1":"$2 }' | xargs docker image rm

