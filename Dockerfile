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

# Set Docker ENV variables
ENV APP_ID="dockertest" \
	APP_NAME="Docker Test Environment" \
	DB_NAME="docker" \
	DB_USER="docker" \
	DB_PASS="docker" \
	DB_RIGHT="READ" \
	DB_URL="file:/var/db/database.sql" \
	BUILD_DEPENDENCIES="\
            ca-certificates \
            curl \
            git-core \
            python3 \
            mysql-client \
            mysql-server \
            "

COPY scripts /scripts
COPY setup/database.sql /var/db/database.sql

WORKDIR home

RUN /bin/bash /scripts/10-install-build-deps.sh \
 && /bin/bash /scripts/30-database.sh \
 && /bin/bash /scripts/40-credentials.sh \
 && /bin/bash /scripts/50-cleanup.sh \
 && rm -rf /scripts

# Create credentials with Docker ENV variables
# setup/credentials.sh ${APP_ID} ${APP_NAME}
RUN /bin/bash /scripts/60-app.sh

EXPOSE 3306

# Create credentials with param ENV vairables
ENTRYPOINT sh app.sh
