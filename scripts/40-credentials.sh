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

echo "All parameter: ${*}"
echo "0 parameter: ${0}"
echo "1 parameter: ${1}"

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
	> "/home/${1}_cred.json"

