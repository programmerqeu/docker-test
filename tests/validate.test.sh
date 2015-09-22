#!/bin/bash

# dockertest
#
# LICENSE:    MIT
#
# @project    dockertest
# @package    scripts
# @author     André Lademann <vergissberlin@googlemail.com>
# @license    http://opensource.org/licenses/MIT

# Include user interface and helper
. ../lib/console.sh
. ../lib/validate.sh

validateArguments $# 2 "Usage: script TEST TEST"

echo mysql-server mysql-server/root_password select PASSWORD | debconf-set-selections
echo mysql-server mysql-server/root_password_again select PASSWORD | debconf-set-selections
