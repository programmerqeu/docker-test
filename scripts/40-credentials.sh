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

messageInfo "Create credentials"

## Create credential directory
mkdir -p /var/credentials \
	&& messageOk "Credential directory created." \
	|| messageError 1 "Something went wrong on creation of credential directory"

# Import database atructure
/bin/bash ./41-credentials-sample.sh $APP_ID $DB_USER $DB_PASS
