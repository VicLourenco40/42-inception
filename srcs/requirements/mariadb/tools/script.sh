#!/usr/bin/env bash

initialized='/var/lib/mysql/.initialized'

if [ ! -e $initialized ]; then
	mariadbd-safe &>/dev/null &

	until mariadb-admin ping &>/dev/null; do
		sleep 1
	done

	mariadb <<- EOF
		ALTER USER 'root'@'localhost' IDENTIFIED BY '$(cat $DB_ROOT_PASSWORD_FILE)';
		CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;
		CREATE USER IF NOT EXISTS '$DB_USER' IDENTIFIED BY '$(cat $DB_PASSWORD_FILE)';
		GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER';
		FLUSH PRIVILEGES;
		SHUTDOWN;
	EOF

	wait

	touch $initialized
fi

mariadbd-safe --bind-address 0.0.0.0
