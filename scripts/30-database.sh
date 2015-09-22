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

# Install & configure database
/bin/bash /scripts/31-database-install.sh

# Import database atructure
/bin/bash /scripts/32-database-import.sh

# Start database
/bin/bash /scripts/33-database-start.sh
