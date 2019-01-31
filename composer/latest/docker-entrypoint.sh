#!/usr/bin/env bash

check_command() {
  for cmd in \
    "about" \
    "archive" \
    "browse" \
    "check-platform-reqs" \
    "clear-cache" \
    "clearcache" \
    "config" \
    "create-project" \
    "depends" \
    "diagnose" \
    "dump-autoload" \
    "dumpautoload" \
    "exec" \
    "global" \
    "help" \
    "home" \
    "i" \
    "info" \
    "init" \
    "install" \
    "licenses" \
    "list" \
    "outdated" \
    "prohibits" \
    "remove" \
    "require" \
    "run-script" \
    "search" \
    "self-update" \
    "selfupdate" \
    "show" \
    "status" \
    "suggests" \
    "u" \
    "update" \
    "upgrade" \
    "validate" \
    "why" \
    "why-not"
  do
    if [ -z "${cmd#"$1"}" ]; then
      return 0
    fi
  done

  return 1
}

function main() {
	# check if the first argument passed in looks like a flag
	if [ "$(printf %c "$1")" = '-' ]; then
	  set -- composer "$@"
	# check if the first argument passed in matches a known command
	elif check_command "$1"; then
	  set -- composer "$@"
	fi

	exec "$@"
}

main "$@"
