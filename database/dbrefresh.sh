#!/usr/bin/env bash

progname="$(basename $0)"

[ -z "${SINERGIO_BASEDIR}" ] && SINERGIO_BASEDIR="/var/opt/sinergio"

dir="${SINERGIO_BASEDIR}/database"

if [ ! -d "${dir}" ]; then
	echo "${progname}: ${dir}: directory not found" >&2
	exit 2
fi

if ! cd "${dir}" 2>/dev/null; then
	echo "${progname}: ${dir}: no permission" >&2
	exit 2
fi

cat schema.sql dbload.sql | mysql -u root -p
