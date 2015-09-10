#!/bin/bash

# dockertest
#
# LICENSE:    MIT
#
# @project    dockertest
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>
# @license    http://opensource.org/licenses/MIT

echo "All parameter: ${*}"
echo "0 parameter: ${0}"
echo "1 parameter: ${1}"
# printenv

printf '{
	"dockertest": {
		"appenv": "%s",
		"appid": "%s",
		"makenv": "%s"
	}
}\n'\
	$1 \
	$1 \
	$1 \
	> "${1}_cred.json"

