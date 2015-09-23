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
/bin/bash /scripts/31-database-install.sh $DB_NAME $DB_USER $DB_PASS $DB_PASS_ROOT

# Import database atructure
/bin/bash /scripts/32-database-import.sh $DB_USER $DB_PASS $DB_FILE
