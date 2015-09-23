#!/bin/bash

# dockertest
#
# LICENSE:    MIT
#
# @project    dockertest
# @package    scripts
# @author     André Lademann <vergissberlin@googlemail.com>
# @license    http://opensource.org/licenses/MIT
# @link		  https://github.com/nkratzke/EasyMySQL/blob/master/Dockerfile


########################################################################################################################
# Include user interface and helper
#
. ../lib/console.sh
. ../lib/validate.sh
. ../lib/mysql.sh

# 1. DB_NAME
# 2. DB_USER
# 3. DB_PASS
# 4. DB_PASS_ROOT
validateArguments $# 4 "Usage: ${code} 31-database-install.sh ${bold_begin}DB_NAME DB_USER DB_PASSWORD DB_PASSWORD_ROOT${bold_end} ${norm}"

########################################################################################################################
# Install database
#
messageInfo "Install database"
debconf-set-selections <<< "mysql-server mysql-server/root_password password $4"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $4"
apt-get -y install mysql-server mysql-client \
    && messageOk "Installation of \"${blue}MySQL-Server${norm}\" successful." \
    || messageError 65 "Error while installation MySQL-Server."


service mysql start \
    && messageOk "MySQL started." \
    || messageError 65 "Something went wrong on start MySQL-Server."
sleep 5

########################################################################################################################
# Configure database
#
messageInfo "Configure database"

# ROOT USER
Q1="UPDATE mysql.user SET Password=PASSWORD('$4') WHERE User='root'; "
Q2="FLUSH PRIVILEGES;"
Q3="GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$4';"
Q4="FLUSH PRIVILEGES;"

# Create database
Q5="CREATE DATABASE IF NOT EXISTS $1;"

# Create user and set previleges
Q6="GRANT USAGE ON *.* TO $2@'%' IDENTIFIED BY '$3';"
Q7="GRANT ALL PRIVILEGES ON $1.* TO $2@'%';"
Q8="FLUSH PRIVILEGES;"
mysqlQuery $4 "\${Q1}" "\${Q2}" "\${Q3}" "\${Q4}" "\${Q5}" "\${Q6}" "\${Q7}" "\${Q8}"

# External access
sed -i "s/\(bind-address[\t ]*\)=.*/\1= 0.0.0.0/" /etc/mysql/my.cnf \
	&& messageOk "External access on database is allowed." \
	|| messageError 1 "Something went wrong on updating database configuration."

sed -i "s/key_buffer/key_buffer_size/g" /etc/mysql/my.cnf \
	&& messageOk "Key buffer size on database is set." \
	|| messageError 1 "Something went wrong on updating database configuration."

########################################################################################################################
# Additional configuration
#
messageInfo "Add additional database configurations"

# Enable remote access (default is localhost only, we change this
# otherwise our database would not be reachable from outside the container)
echo '[mysqld]
myisam-recover-options = BACKUP
' > /etc/mysql/conf.d/dockertest.cnf \
	&& messageOk "Addition configuration file for database created." \
	|| messageError 1 "Something went wrong on creating additional configuration file for database."


########################################################################################################################
# Reastart service
#
messageInfo "Restart MySQL"

service mysql restart \
    && messageOk "MySQL restarted." \
    || messageError 65 "Something went wrong on restart MySQL-Server."

sleep 5
