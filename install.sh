#!/usr/bin/env bash
set -euo pipefail

{
	extract() {
		local -r dest="${1:?}"
		local -r tarball="${dest}/tarball.tar.gz"

		for file in $(tar -tf "${tarball}" | grep src); do
			tar -xf "${tarball}" -C "${dest}" --strip-components 2 "${file}"
		done

		rm -rf "${tarball:?}"
	}

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

		${download_cmd} >"${dest}/tarball.tar.gz"
		extract "${dest}"

		echo "Installed at ${dest}"
	}

	main
}
