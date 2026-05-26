# Inception Dev Doc

## Installation
**Requirements**
- [Docker Engine](https://docs.docker.com/engine/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)

**Steps**
- Clone the repository
```
git clone https://github.com/VicLourenco40/42-inception.git
cd ./42-inception
```

- Configure the following variables on ./srcs/.env :
```
DOMAIN_NAME=vde-albu.42.fr

DB_NAME=inception
DB_USER=inception

WP_TITLE=Inception
WP_USER=user
WP_ADMIN=god
```

- Create the following secret files on ./secrets/ :
  - Database user password: `db_password.txt`
  - Database root password: `db_root_password.txt`
  - WordPress user password: `wp_password.txt`
  - WordPress admin password: `wp_admin_password.txt`

- Build images
```
make
```

## Makefile Usage
**Run containers**
```
make up
```
The website becomes accessible at https://DOMAIN_NAME:443 e.g. https://vde-albu.42.fr:443

**Stop containers**
```
make down
```

**Build images**
```
make build
```

**Clean docker data**
```
make clean
```

**Clean docker data and rebuild images**
```
make re
```

## Docker Commands
- Run containers: `docker compose -f COMPOSE_FILE up`
- Stop containers: `docker compose -f COMPOSE_FILE down`
- List volumes: `docker volume ls`
- Detail volume: `docker volume inspect VOLUME_NAME`
- Delete volume: `docker volume rm VOLUME_NAME`
- List containers: `docker container ls -a`
- List running containers: `docker container ls`
- Detail container: `docker container inspect CONTAINER_NAME`
- Delete container: `docker container rm CONTAINER_NAME`

## Project Data
WordPress and MariaDB volumes are located at /home/USER/data/volumes/.

Data persists until volumes are deleted.
