#!/bin/bash

# dockertest
#
# LICENSE:    MIT
#
# @project    dockertest
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>
# @license    http://opensource.org/licenses/MIT


# Delete all containers
docker rm $(docker ps -a -q)
# Delete all images
docker rmi $(docker images -q)
