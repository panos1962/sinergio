#!/usr/bin/env bash

progname="$(basename $0)"

[ -z "${SINERGIO_BASEDIR}" ] && SINERGIO_BASEDIR="/var/opt/sinergio"

[ -d "${SINERGIO_BASEDIR}" ] || {
	echo "${progname}: ${SINERGIO_BASEDIR}: directory not found" >&2
	exit 2
}

dir="${SINERGIO_BASEDIR}/database"

[ -d "${dir}" ] || {
	echo "${progname}: ${dir}: directory not found" >&2
	exit 2
}

cd "${dir}" 2>/dev/null || {
	echo "${progname}: ${dir}: permission denied" >&2
	exit 2
}

cat schema.sql dbload.sql | mysql -u root -p
