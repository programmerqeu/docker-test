#!/bin/bash

# dockertest
#
# LICENSE:    MIT
#
# @project    dockertest
# @package    scripts
# @author     André Lademann <vergissberlin@googlemail.com>
# @license    http://opensource.org/licenses/MIT



# Check count of arguments
#
# @return void
function validateArguments {
	if [ $1 -ne $2 ]
	then
		messageError 65 $3
	fi
}
