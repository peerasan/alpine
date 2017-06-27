#!/bin/sh

# parameters
MYSQL_ROOT_PWD=${MYSQL_ROOT_PWD:-"mysql"}

##########################################################################################
#if [ ! -d "/run/mysqld" ]; then
#	install -o mysql -g mysql -d -m 755 /run/mysqld
#fi


if [ -d /var/lib/mysql/mysql ]; then
	echo '[i] MySQL directory already present, skipping creation'
else
	echo "[i] MySQL data directory not found, creating initial DBs"
	
	# init database
	echo 'Initializing database'
	mysql_install_db --user=mysql
	echo 'Database initialized'

	/usr/bin/mysqld_safe --user=mysql &
	sleep 10;
	/usr/bin/mysqladmin -u root -h localhost password $MYSQL_ROOT_PWD;
	echo "[i] MySql root password: $MYSQL_ROOT_PWD"
fi
##########################################################################################

chown -Rf nginx:nginx /appps

# Start supervisord and services
/usr/bin/supervisord -n -c /etc/supervisord.conf
