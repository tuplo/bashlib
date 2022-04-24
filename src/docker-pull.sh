#!/usr/bin/env bash

# docker_pull IMAGE_NAME
docker_pull() {
	local -r image="${1:?}"

	if [[ ! "${image}" =~ ^local ]]; then
		docker pull "${image}"
	fi
}
