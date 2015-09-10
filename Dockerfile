# dockertest
#
# LICENSE:    MIT
#
# @project    dockertest
# @package    run
# @author     André Lademann <vergissberlin@googlemail.com>
# @license    http://opensource.org/licenses/MIT

# Use the latest ubuntu image as base
FROM ubuntu:latest

# Install Midnight Commander for testing purpose
RUN  apt-get -y update && apt-get install -y mc

# Set Docker ENv variables
ENV APP_ID "dockertest"

# Copy local data to container and change to this directory
COPY . home
WORKDIR home

# Create credentials with Docker ENV variables
RUN sh credentials.sh ${APP_ID}

# Create credentials with param ENV vairables
ENTRYPOINT sh app.sh
