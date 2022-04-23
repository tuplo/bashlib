#!/usr/bin/env bash
set -euo pipefail

function get_last_tag_commit_hash() {
	git rev-list --tags --max-count=1
}

function get_last_commit_hash() {
	git rev-parse HEAD
}

function get_last_commit_message() {
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
	local -r last_commit_message=$(get_last_commit_message)
	local -r last_version=$(get_latest_version)
	local -r semver=". $(dirname -- "${BASH_SOURCE[0]}")/semver.sh"

	if [[ $(get_last_commit_hash) == $(get_last_tag_commit_hash) ]]; then
		echo "$last_version"
		return
	fi

	if [[ "${last_commit_message}" =~ ^feat ]]; then
		${semver} bump minor "${last_version}"
	elif [[ "${last_commit_message}" =~ ^fix ]]; then
		${semver} bump patch "${last_version}"
	fi
}

auth="${GIT_USER}:${GIT_PASSWORD}"
last_commit_hash=$(get_last_commit_hash)
last_version=$(get_latest_version)
new_version=$(get_new_version)

if [[ -n "${new_version}" && "${new_version}" != "${last_version}" ]]; then
	echo "Bumping version to ${new_version}"
	curl --silent \
		--location \
		--output /dev/null \
		--silent \
		--user "${auth}" \
		--request POST https://api.github.com/repos/tuplo/bashlib/git/refs \
		--data-raw '{
			"ref": "refs/tags/v'"${new_version}"'", 
			"sha": "'"${last_commit_hash}"'"
		}'
fi
