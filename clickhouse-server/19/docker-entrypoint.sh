#!/usr/bin/env bash

# usage: process_init_file FILENAME CLICKHOUSE_COMMAND...
#    ie: process_init_file foo.sql clickhouse client
process_init_file() {
	local file="$1"; shift

	case "$file" in
		# create databases, tables
		*.sql)    echo "$0: running $file"
				  clickhouse client "$(port)" "$(database)" --query="$(cat "$file")"
				  echo;;
		*.sql.gz) echo "$0: running $file"
				  clickhouse client "$(port)" "$(database)" --query="$(gunzip -c "$file")"
				  echo;;
		# insert data
		*.csv)    echo "$0: running $file"
				  cat "$file" | clickhouse client "$(port)" "$(database)" --query="INSERT INTO test FORMAT CSV"
				  echo;;
		*.csv.gz) echo "$0: running $file"
				  gunzip -c "$file" | clickhouse client "$(port)" "$(database)" --query="INSERT INTO test FORMAT CSV"
				  echo;;
		*)        echo "$0: ignoring $file";;
	esac
	echo
}

# get database params
database() {
	if [ ! -z ${DATABASE_NAME} ]; then
		echo "--database=$DATABASE_NAME"
	fi
}

# get clickhouse-server port
port() {
	if [ ! -z ${DATABASE_PORT} ]; then
		echo "--port=$DATABASE_PORT"
	fi
}

main() {
	if [ "$1" = "/usr/bin/clickhouse-server" ]; then
		if [ ! -z ${DATABASE_NAME} ]; then
			"$@" &
			local readonly pid="$!"
			local result="$?"

			for i in {30..0}; do
				clickhouse client "$(port)" --query="SHOW DATABASES" &> /dev/null
				result="$?"

				if [ ${result} = "0" ]; then
					break
				fi

				sleep 1
			done

			if [ "$i" = 0 ]; then
				echo >&2 'Clickhouse init process failed.'
				exit 1
			fi

			clickhouse client "$(port)" --query="CREATE DATABASE IF NOT EXISTS $DATABASE_NAME"

			for file in /docker-entrypoint-initdb.d/*; do
				process_init_file "$file"
			done

			if ! kill -s TERM "$pid" || ! wait "$pid"; then
				echo >&2 'Clickhouse init process failed.'
				exit 1
			fi

			export DATABASE_NAME=
		fi
	fi

	exec "$@"
}

main "$@"
