#!/bin/sh

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

2>&1

source $SCRIPT_DIR/set_env.sh
restic unlock

echo "Starting backup to B2"

restic backup --exclude-file=$HOME/.config/restic/exclude.txt --exclude-caches --files-from=$HOME/.config/restic/include.txt

restic check

exec $SCRIPT_DIR/unset_env.sh

echo "Backup complete"

exit 0
