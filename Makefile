COMPOSE = ./srcs/docker-compose.yml

.PHONY: up down clean re

up: $(VOLUMES)
	docker compose -f $(COMPOSE) up

down:
	docker compose -f $(COMPOSE) down

clean: down
	docker system prune -af
	docker volume prune -af

re: clean up
