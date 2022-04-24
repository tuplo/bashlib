#!/usr/bin/env bash

# wait_for_file FILE
wait_for_file() {
	local file=${1:?}

	echo "Waiting for ${file}"
	until [[ -f "${file}" ]]; do
		sleep 1
		echo -n "."
	done

	echo "OK"
}
