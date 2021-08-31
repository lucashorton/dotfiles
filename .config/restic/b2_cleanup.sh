#!/bin/sh

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

2>&1

source $SCRIPT_DIR/set_env.sh

restic unlock

echo "Starting B2 cleanup"

restic forget --keep-daily 7 --keep-weekly 4 --keep-monthly 12 --keep-yearly 1

restic prune

exec $SCRIPT_DIR/unset_env.sh

echo "Cleanup complete"

exit 0