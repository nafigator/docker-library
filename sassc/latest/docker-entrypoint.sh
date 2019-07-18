#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
if [ ! -z "$1" ]; then
	set -- sassc "$@"
fi

exec "$@"
