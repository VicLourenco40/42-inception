COMPOSE = ./srcs/docker-compose.yml

.PHONY: build up down clean re

build:
	docker compose -f $(COMPOSE) build

up:
	docker compose -f $(COMPOSE) up

down:
	docker compose -f $(COMPOSE) down

clean: down
	docker system prune -af
	docker volume prune -af

re: clean build
