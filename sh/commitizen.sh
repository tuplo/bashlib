#!/usr/bin/env bash
set -euo pipefail

function get_last_tag_commit_hash() {
	git rev-list --tags --max-count=1
}

function get_last_commit_hash() {
	git rev-parse HEAD
}

function get_last_commit() {
	git log -1 --pretty=%B
}

function get_latest_version() {
	local -r latest_tag_hash=$(get_last_tag_commit_hash)
	if [[ -z "$latest_tag_hash" ]]; then
		echo "v1.0.0"
		return
	fi

	local -r git_version=$(git describe --tags "${latest_tag_hash}")
	echo "$git_version"
}

function get_new_version() {
	local -r last_commit=$(get_last_commit)
	local -r last_version=$(get_latest_version)
	local -r semver=". $(dirname -- "${BASH_SOURCE[0]}")/semver.sh"

	if [[ $(get_last_commit_hash) == $(get_last_tag_commit_hash) ]]; then
		echo "$last_version"
		return
	fi

	if [[ "${last_commit}" =~ ^feat ]]; then
		${semver} bump minor "${last_version}"
	elif [[ "${last_commit}" =~ ^fix ]]; then
		${semver} bump patch "${last_version}"
	fi
}

last_version=$(get_latest_version)
new_version=$(get_new_version)
if [[ -n "${new_version}" && "${new_version}" != "${last_version}" ]]; then
	last_commit=$(get_last_commit)
	git tag -a "v${new_version}" -m "${last_commit}"
	echo "Bumped version to ${new_version}"
fi
