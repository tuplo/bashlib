#!/usr/bin/env bash
set -euo pipefail

# wait_for_file FILE
function wait_for_file() {
	local file=${1:?}

	echo "Waiting for ${file}"
	until [[ -f "${file}" ]]; do 
		sleep 1
		echo -n "."
	done
}
