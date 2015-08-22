#!/bin/bash

# piball
#
# LICENSE:    MIT
#
# @project    piball
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>
# @copyright  piball.io
# @license    http://opensource.org/licenses/MIT


# Delete all containers
docker rm $(docker ps -a -q)
# Delete all images
docker rmi $(docker images -q)
