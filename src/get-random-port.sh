#!/usr/bin/env bash

# get_random_port
get_random_port() {
	local port
	
	while
		port=$(shuf -n 1 -i 49152-65535)
		netstat -atun | grep -q "${port}"
	do
		continue
	done

	echo "${port}"
}
