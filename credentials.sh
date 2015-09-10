#!/bin/bash

# dockertest
#
# LICENSE:    MIT
#
# @project    dockertest
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>
# @license    http://opensource.org/licenses/MIT

echo "The env var is: ${*}"
echo "The env var is: ${TEST}"

printf '{
	"dockertest": {
		"appenv": "%s",
		"appid": "%s",
		"makenv": "%s",
	}
}\n'\
	$0 \
	$0 \
	$0 \
	> "${0}_cred.json"

