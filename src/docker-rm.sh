#!/usr/bin/env bash

# docker_rm CONTAINER_NAME
docker_rm() {
	local container_name=${1:?}

	local -r is_there=$(docker ps --all --quiet --filter name="${container_name}")
	if [[ -n "${is_there}" ]]; then
		docker rm --force "${container_name}"
	fi
}
