#!/usr/bin/env bash

get_uuid() {
	local -r uuid="$(od -x /dev/urandom | head -1 | awk '{OFS="-"; print $2$3,$4,$5,$6,$7$8$9}')"
	echo "${uuid}"
}
