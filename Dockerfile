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
	DB_PASS_ROOT="docker" \
	DB_FILE="/setup/database.sql" \
	DB_ALLOW_EMPTY_PASSWORD="true" \
	BUILD_DEPENDENCIES="\
			curl \
            debconf-utils \
            mc
            "

COPY . /app
WORKDIR /app

RUN /bin/bash /app/scripts/10-install-build-deps.sh \
 && /bin/bash /app/scripts/30-database.sh \
 && /bin/bash /app/scripts/40-credentials.sh \
 && /bin/bash /app/scripts/50-cleanup.sh \
 && rm -rf /app

# Create credentials with Docker ENV variables
# setup/credentials.sh ${APP_ID} ${APP_NAME}

# Install starting script
COPY scripts/60-app.sh /usr/local/bin/app.sh
RUN chmod +x /usr/local/bin/app.sh

# Data
VOLUME /var/lib/mysql

EXPOSE 3306

# Create credentials with param ENV vairables
ENTRYPOINT /usr/local/bin/app.sh
