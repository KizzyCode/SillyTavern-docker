#!/bin/sh
set -euo pipefail

# Update certificate list
update-ca-certificates

# Set permissions and launch silly tavern as sillytavern user
chown -R sillytavern /home/node/app
exec su sillytavern -c \
    ./docker-entrypoint.sh
