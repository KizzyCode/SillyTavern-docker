#!/bin/sh
set -euo pipefail

# Update certificate list and launch sillytavern as sillytavern user
update-ca-certificates
exec su - sillytavern -c /usr/libexec/sillytavern.sh
