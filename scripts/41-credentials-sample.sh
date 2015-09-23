#!/bin/bash

# dockertest
#
# LICENSE:    MIT
#
# @project    dockertest
# @package    scripts
# @author     André Lademann <vergissberlin@googlemail.com>
# @license    http://opensource.org/licenses/MIT

########################################################################################################################
# Include user interface and helper
#
. ../lib/console.sh
. ../lib/validate.sh

messageInfo "Create credentials sample file"
validateArguments $# 3 "Usage: ${code}41-credetials-sample.sh ${bold_begin}ID FOO BAR${bold_end}${norm}"

########################################################################################################################
# Ourput template in file
#
printf '{
	"dockertest": {
		"appid": "%s",
		"user": "%s",
		"pass": "%s"
	}
}\n'\
	$1 \
	$2 \
	$3 \
	> "/var/credentials/${1}_cred.json" \
	&& messageOk "Credential file ${code}/var/credentials/${1}_cred.json${norm} saved." \
	|| messageError 1 "Something went wrong on creating credential sample file."
