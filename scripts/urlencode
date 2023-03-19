#!/usr/bin/env bash
# stolen shamelessly from rwxrob
# yeah, i totally stole this from stack exchange, no shame

rawurlencode() {
	local string="${1}"
	local strlen=${#string}
	local encoded=""
	local pos c o

	for ((pos = 0; pos < strlen; pos++)); do
		c=${string:$pos:1}
		case "$c" in
		[-_.~a-zA-Z0-9]) o="${c}" ;;
		*) printf -v o '%%%02x' "'$c'" ;;
		esac
		encoded+="${o}"
	done
	echo "${encoded}"  # You can either set a return variable (FASTER)
	REPLY="${encoded}" #+or echo the result (EASIER)... or both... :p
}

if test -n "$1"; then
	rawurlencode "$*"
	exit
fi

IFS=
while read -r line; do
	rawurlencode "$line"
done
