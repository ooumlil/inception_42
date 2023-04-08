.PHONY: build up logs down

build:
	docker-compose -f ./srcs/docker-compose.yml build

logs:
	docker-compose -f ./srcs/docker-compose.yml logs

up:
	docker-compose -f ./srcs/docker-compose.yml up -d

upb:
	docker-compose -f ./srcs/docker-compose.yml up --build -d
down:
	docker-compose -f ./srcs/docker-compose.yml down
