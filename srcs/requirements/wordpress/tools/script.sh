#!/usr/bin/env bash

initialized='/var/www/html/.initialized'

if [ ! -e $initialized ]; then
	wget -q 'https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar'
	chmod +x ./wp-cli.phar
	mv ./wp-cli.phar /usr/local/bin/wp

	mkdir -p /var/www/html/
	cd /var/www/html/
	chown -R www-data:www-data .

	wp core download --allow-root
	wp config create --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$(cat $DB_PASSWORD_FILE)" --dbhost='mariadb' --allow-root
	wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN" --admin_email="$WP_ADMIN@email.com" --admin_password="$(cat $WP_ADMIN_PASSWORD_FILE)" --allow-root --skip-email
	wp user create "$WP_USER" "$WP_USER@email.com" --user_pass="$(cat $WP_PASSWORD_FILE)" --allow-root

	touch $initialized
fi

php-fpm8.2 -F
