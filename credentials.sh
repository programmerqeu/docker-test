#!/bin/bash

# piball
#
# LICENSE:    MIT
#
# @project    dockertest
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>
# @license    http://opensource.org/licenses/MIT

echo "The env var is: ${APP_ENV}"
echo "The app id is: ${APP_ID}"

printf '{
	"dockertest": {
		"appenv": "%s",
		"appid": "%s"
	}
}\n'\
	$APP_ENV \
	$APP_ID \
	> "${APP_ID}_cred.json"

