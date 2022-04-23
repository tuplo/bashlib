#!/usr/bin/env bash
set -euo pipefail

{
	url="https://github.com/tuplo/bashlib//tarball/main"
	dest="${PWD}/@tuplo/bashlib"

	if [[ -n "$(which curl)" ]]; then
		download="curl -sSL ${url}"
	elif [[ -n "$(which wget)" ]]; then
		download="wget -q ${url} -O -"
	else
		echo "Neither curl nor wget found"
		exit 1
	fi

	rm -rf "${dest:?}"
	mkdir -p "${dest:?}"

	if ! ${download} | tar xz -C "${dest}" --exclude='*sh\/*' --exclude='.github/*' --strip-components=2; then
		echo "Failed to download @tuplo/bashlib"
		exit 1
	fi

	echo "@tuplo/bashlib installed at ${dest}"
}
