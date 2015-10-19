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

apt-get -y update \
	&& messageOk "Package manager repository updated." \
	|| messageError 1 "Something went wrong on updating package manager repository."

apt-get install -y $BUILD_DEPENDENCIES --no-install-recommends \
	&& messageOk "Dependencies installed." \
	|| messageError 1 "Something went wrong on install dependencies."
