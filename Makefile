COMPOSE = ./srcs/docker-compose.yml
DATA = $(HOME)/data/
VOLUMES = $(DATA)/wordpress/ $(DATA)/mariadb/

.PHONY: all up down clean re

all: up

up: $(VOLUMES)
	docker compose -f $(COMPOSE) up

down:
	docker compose -f $(COMPOSE) down

clean: down
	docker system prune -af
	docker volume prune -af
	sudo rm -rf $(DATA)

re: clean all

$(VOLUMES):
	mkdir -p $@
