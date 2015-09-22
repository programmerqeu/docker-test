#!/bin/bash

# dockertest
#
# LICENSE:    MIT
#
# @project    dockertest
# @package    scripts
# @author     André Lademann <vergissberlin@googlemail.com>
# @license    http://opensource.org/licenses/MIT
# @link		  https://github.com/nkratzke/EasyMySQL/blob/master/start-database.sh
# @link       http://www.bluepiccadilly.com/2011/12/creating-mysql-database-and-user-command-line-and-bash-script-automate-process

# if command starts with an option, prepend mysqld
MYSQL=`which mysql`

# Include user interface and helper
. ../lib/console.sh
. ../lib/validate.sh

# 1. DB_NAME
# 2. DB_USER
# 3. DB_PASS
# 4. DB_PASS_ROOT
validateArguments $# 4 "Usage: ${code} 33-database-start.sh ${bold_begin}DB_NAME DB_USER DB_PASSWORD DB_PASSWORD_ROOT${bold_end} ${norm}"


Q1="CREATE DATABASE IF NOT EXISTS $1;"
Q2="GRANT USAGE ON *.* TO $2@'%' IDENTIFIED BY '$3';"
Q3="GRANT ALL PRIVILEGES ON $1.* TO $2@'%';"
Q4="FLUSH PRIVILEGES;"
Q5="GRANT USAGE ON *.* TO root@'%' IDENTIFIED BY '$3';"
Q6="GRANT ALL PRIVILEGES ON *.* TO root@'%';"
Q7="FLUSH PRIVILEGES;"

messageInfo "Creating mysql DATABASE ${red}${1}${norm}"
messageInfo "Creating mysql USER ${red}${2}${norm}"

mysqlQuery $4 $Q1 $Q2 $Q3 $Q4 $Q5 $Q6 $Q7
