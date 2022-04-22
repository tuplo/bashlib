#!/usr/bin/env bash
set -euo pipefail

# docker_pull IMAGE_NAME
function docker_pull() {
	local image="${1:?}"

	if [[ ! "${image}" =~ '^local' ]]; then
		docker pull "${image}"
	fi
}
