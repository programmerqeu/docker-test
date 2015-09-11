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
# @link		  https://github.com/nkratzke/EasyMySQL/blob/master/Dockerfile

# Install database

# Configure database
/bin/bash /scripts/31-database-configure.sg

# Start database
/bin/bash /scripts/32-database-start.sg
