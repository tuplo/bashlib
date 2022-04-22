#!/usr/bin/env bash
set -euo pipefail

# wait_for_url URL [-u user:passwd]
function wait_for_url() {
  local -r url="$( cut -d ' ' -f 1 <<< "$@" )"
  local -r options="$( cut -d ' ' -f 2- <<< "$@" )"

  while getopts ":u:" optname "${options}"; do
  	case "${optname}" in
    u) auth="${OPTARG:1}" ;;
    *) ;;
    esac
  done

	curl="curl --output /dev/null --insecure --silent --head --fail ${url}"
	if [[ -n "${auth}" ]]; then
		curl="${curl} --user ${auth}"
	fi

	echo "Waiting for ${url}"
	until ${curl}; do
		sleep 1
		echo -n "."
	done
}
