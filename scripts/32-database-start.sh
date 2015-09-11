#!/bin/bash
set -ex

# dockertest
#
# LICENSE:    MIT
#
# @project    dockertest
# @package    scripts
# @author     André Lademann <vergissberlin@googlemail.com>
# @license    http://opensource.org/licenses/MIT
# @link		  https://github.com/nkratzke/EasyMySQL/blob/master/start-database.sh

# This script starts the database server.
echo "Creating user $DB_USER for databases loaded from $DB_URL"

# Import database if provided via 'docker run --env url="http:/ex.org/db.sql"'
echo "Adding data into MySQL"
/usr/sbin/mysqld &
sleep 5
curl $DB_URL -o import.sql

# Fixing some phpmysqladmin export problems
sed -ri.bak 's/-- Database: (.*?)/CREATE DATABASE \1;\nUSE \1;/g' import.sql

# Fixing some mysqldump export problems (when run without --databases switch)
# This is not tested so far
# if grep -q "CREATE DATABASE" import.sql; then :; else sed -ri.bak 's/-- MySQL dump/CREATE DATABASE `database_1`;\nUSE `database_1`;\n-- MySQL dump/g' import.sql; fi

mysql --default-character-set=utf8 < import.sql
rm import.sql
mysqladmin shutdown
echo -e "\033[32mGreenFinished"

# Now the provided user credentials are added
/usr/sbin/mysqld &
sleep 5
echo -e "\033[32mGreenCreating user"
echo "CREATE USER '$DB_USER' IDENTIFIED BY '$DB_PASSWORD'" | mysql --default-character-set=utf8
echo "REVOKE ALL PRIVILEGES ON *.* FROM 'DB_USER'@'%'; FLUSH PRIVILEGES" | mysql --default-character-set=utf8
echo "GRANT SELECT ON *.* TO '$DB_USER'@'%'; FLUSH PRIVILEGES" | mysql --default-character-set=utf8
echo -e "\033[32mGreenFinished"

if [ "$DB_RIGHT" = "WRITE" ]; then
echo -e "\033[91mLightAdding write access"
echo "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql --default-character-set=utf8
fi

# And we restart the server to go operational
mysqladmin shutdown
echo -e "\033[34mBlue» Starting MySQL server"
/usr/sbin/mysqld

