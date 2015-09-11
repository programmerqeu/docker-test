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

apt-get -y update
apt-get install -y $BUILD_DEPENDENCIES --no-install-recommends
