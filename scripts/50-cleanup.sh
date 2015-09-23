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
messageInfo "Cleanup container"

# apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false -o APT::AutoRemove::SuggestsImportant=false $buildDeps
# apt-get c# lean
# rm -rf /usr/src/*
# rm -rf /var/lib/apt/lists/*
# rm -rf /tmp/*
# rm -rf /var/tmp/*
# for logs in `find /var/log -type f`; do > $logs; done
# rm -rf /usr/share/locale/*
# rm -rf /usr/share/man/*
# rm -rf /usr/share/doc/*
