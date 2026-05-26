## Inception User Doc

## Stack Services
- NGINX
- WordPress (PHP-FPM)
- MariaDB

## Usage
**Run containers**
```
make up
```

**Stop containers**
```
make down
```

## Website
- Index: `https://DOMAIN_NAME:443/index.php`
- Login: `https://DOMAIN_NAME:443/wp-login.php`
- Admin panel: `https://DOMAIN_NAME:443/wp-admin/index.php`

## Credentials
For changes to take effect, a volume wipe is needed.
- Passwords: `./secrets/*`
- Usernames: `./srcs/.env`

## Service Status
- Check running containers: `docker ps`
- NGINX: `docker exec nginx service nginx status`
- WordPress (PHP-FPM): `docker exec wordpress service php8.2-fpm status`
- MariaDB: `docker exec -it mariadb mariadb-admin ping -u USER -p`
