#!/bin/sh

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

2>&1

source $SCRIPT_DIR/b2_credentials.sh

echo "Starting backup to B2"

restic backup -r b2:$B2_BUCKET:/ backup	--exclude-file=$SCRIPT_DIR/exclude.txt --exclude-caches --files-from=$SCRIPT_DIR/include.txt

restic check

echo "Backup complete"

exit 0
