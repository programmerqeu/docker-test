#!/bin/bash

# dockertest
#
# LICENSE:    MIT
#
# @project    dockertest
# @package    scripts
# @author     André Lademann <vergissberlin@googlemail.com>
# @license    http://opensource.org/licenses/MIT

# MySQL
function mysqlQuery {
	for query in ${@:2}
	do
		eval queryString="$query"
		mysql -uroot -p$1 -e"${queryString}" \
			&& messageCode "${queryString}" \
			|| messageError $? "${queryString}"
			sleep 1
	done
	messageOk "Database configuration successful"
}
