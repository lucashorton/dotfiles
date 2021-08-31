#!/bin/sh

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

2>&1

source $SCRIPT_DIR/set_env.sh

echo "Mounting B2 backup to /mnt/restic"
restic mount /mnt/restic
echo "Done"

exit 0