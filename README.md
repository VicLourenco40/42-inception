*This project has been created as part of the 42 curriculum by vde-albu.*

# Inception
Secure web service deployment using Docker Compose.

## Description
Complete WordPress infrastructure setup using Docker Compose.

Services (web server, WordPress and database) are individually containerized,
communicate via Docker networking, and data persists between container
lifecycles using Docker volumes.

Every service used (./srcs/requirements/*/) contains:
- Dockerfile for image building
- Configuration files (stored in */conf/)
- Run scripts (stored in */tools/)

**Virtual Machines vs Docker**
Virtual machines emulate physical hardware.
A VM runs its own kernel and OS, and has access to a preconfigured fixed amount of
resources allocated to it from the host machine.

Docker containers emulate user-space (the part of an OS where user processes run).
A container uses the host machine's kernel, and shares resources with the
host machine.

**Secrets vs Environment Variables**
Secrets are used to handle sensitive data (passwords, private keys, ...) that
shouldn't be leaked. Secrets shouldn't be stored in source code, Dockerfiles or
built images.

Environment variables are values that are usually defined in order to affect the
behavior of software. In the case of Docker, they can be used to pass information
into the build process of an image, or into running containers.

**Docker Network vs Host Network**
Docker's bridge network allows for container-to-container communication, and is
isolated from the host network. Inbound access is still possible via port publishing.

Docker's host network allows containers to use the same network as the host.
In terms of networking, containers behave as if they're directly running on the host
machine, which increases performance, but provides no isolation.

**Docker Volumes vs Bind Mounts**
Docker volumes and bind mounts are two options for persistent data storage in Docker.

Volumes are managed by Docker. They're abstracted from the host machine's filesystem,
which makes them portable, isolated, and easy to manage with Docker tooling.

Bind Mounts are managed by the host OS, and are dependent on its filesystem.
They're useful when easy access to the files is needed, but come with the
side effect of containers being able to alter the host's filesystem.

## Instructions

### Installation
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

### Usage
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

## Resources
**Documentation**
- [Docker documentation](https://docs.docker.com/)
- [Dockerfile reference](https://docs.docker.com/reference/dockerfile/)
- [Compose file reference](https://docs.docker.com/reference/compose-file/)
- [NGINX documentation](https://nginx.org/en/docs/)
- [MariaDB documentation](https://mariadb.org/documentation/)

**Useful links**
- [Docker building best practices](https://docs.docker.com/build/building/best-practices/)
- [Docker compose quickstart](https://docs.docker.com/compose/gettingstarted/)
- [NGINX beginner's guide](https://nginx.org/en/docs/beginners_guide.html)
- [Installing WordPress](https://make.wordpress.org/cli/handbook/guides/installing/)
- [Installing MariaDB](https://mariadb.com/docs/server/mariadb-quickstart-guides/installing-mariadb-server-guide)

**AI usage**
Occasional help in searching documentation, when struggling to find specific details manually.
