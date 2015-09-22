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

# 1. DB_USER
# 2. DB_PASS
# 3. D_FILE
validateArguments $# 3 "Usage: ${code}32-database-import.sh ${bold_begin}DB_USER DB_PASSWORD DB_FILE${bold_end}${norm}"

########################################################################################################################
# Import database structure
#

messageInfo "Import mysql DATABASE with User \"${blue}${1}${norm}\" from file \"${blue}${3}${norm}\""
mysql -u$1 -p$2 < $3 \
    && messageOk "Import from \"${blue}${3}${norm}\" successful." \
    || messageError 1 "Error while import from file \"$3\"."


########################################################################################################################
# Reastart service
#
messageInfo "Restart MySQL"
service mysql restart
