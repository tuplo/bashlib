#!/usr/bin/env bash
set -euo pipefail

# get_random_port
function get_random_port() {
	while
		port=$(shuf -n 1 -i 49152-65535)
		netstat -atun | grep -q "${port}"
	do
		continue
	done

	echo "${port}"
}
