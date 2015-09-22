#!/bin/bash

# dockertest
#
# LICENSE:    MIT
#
# @project    dockertest
# @package    scripts
# @author     André Lademann <vergissberlin@googlemail.com>
# @license    http://opensource.org/licenses/MIT

# Include user interface and helper
. ../lib/console.sh
. ../lib/mysql.sh

# MySQL
Q1="SELECT mysql.user WHERE User='root'; "
Q2="SELECT mysql.user WHERE User='docker'; "

mysqlQuery $1 "\${Q1}" "\${Q2}"

echo mysql-server mysql-server/root_password select PASSWORD | debconf-set-selections
echo mysql-server mysql-server/root_password_again select PASSWORD | debconf-set-selections
