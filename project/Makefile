.PHONY: all logs up up_build down down_volume stop

all:
	mkdir -p $(HOME)/data/wp_db $(HOME)/data/wp_files
	docker-compose -f ./srcs/docker-compose.yml build

logs:
	docker-compose -f ./srcs/docker-compose.yml logs

up:
	docker-compose -f ./srcs/docker-compose.yml up

up_build:
	mkdir -p $(HOME)/data/wp_db $(HOME)/data/wp_files
	docker-compose -f ./srcs/docker-compose.yml up --build --force-recreate

down:
	docker-compose -f ./srcs/docker-compose.yml down

down_volume:
	docker-compose -f ./srcs/docker-compose.yml down -v
	sudo rm -rf ~/data/wp_files ~/data/wp_db

stop:
	docker-compose -f ./srcs/docker-compose.yml stop
