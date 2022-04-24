#!/usr/bin/env bash
set -euxo pipefail

{
	main() {
		local -r include_dir="${HOME}/.local/include"
		local -r dest="${include_dir}/@tuplo/bashlib"
		local -r url="https://github.com/tuplo/bashlib//tarball/main"
		local download_cmd

		# make sure global include dir is there
		mkdir -p "${include_dir}"

		if [[ -n "$(which curl)" ]]; then
			download_cmd="curl -sSL ${url}"
		elif [[ -n "$(which wget)" ]]; then
			download_cmd="wget -q ${url} -O -"
		else
			echo "Neither curl nor wget found"
			exit 1
		fi

		rm -rf "${dest:?}"
		mkdir -p "${dest:?}"

		if ! ${download_cmd} | tar xz -C "${dest}" --strip-components=2 "*/src/*"; then
			echo "Failed to download @tuplo/bashlib"
			exit 1
		fi

		echo "Installed at ${dest}"
	}

	main
}
