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
	DB_FILE="/app/setup/database.sql" \
	DB_ALLOW_EMPTY_PASSWORD="true" \
	BUILD_DEPENDENCIES="\
			curl \
            debconf-utils \
            mc" \
    TERM=xterm

COPY . /app
WORKDIR /app/scripts

RUN /bin/bash /app/scripts/10-dependencies.sh \
 && /bin/bash /app/scripts/30-database.sh \
 && /bin/bash /app/scripts/40-credentials.sh \
 && /bin/bash /app/scripts/50-cleanup.sh \
 && rm -rf /app

# Install starting script
COPY app/app.sh /usr/local/bin/app.sh
RUN chmod +x /usr/local/bin/app.sh

# Data
VOLUME /var/lib/mysql

EXPOSE 3306

WORKDIR /root

# Create credentials with param ENV vairables
ENTRYPOINT /usr/local/bin/app.sh
