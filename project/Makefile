.PHONY: all build build_no_cache logs up up_detach up_build down down_volume stop

build:
	docker-compose -f ./srcs/docker-compose.yml build

build_no_cache:
	docker-compose -f ./srcs/docker-compose.yml build --no-cache

logs:
	docker-compose -f ./srcs/docker-compose.yml logs

up:
	docker-compose -f ./srcs/docker-compose.yml up

up_detach:
	docker-compose -f ./srcs/docker-compose.yml up -d

up_build:
	docker-compose -f ./srcs/docker-compose.yml up --build --force-recreate

down:
	docker-compose -f ./srcs/docker-compose.yml down

down_volume:
	docker-compose -f ./srcs/docker-compose.yml down -v

stop:
	docker-compose -f ./srcs/docker-compose.yml stop
