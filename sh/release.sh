#!/usr/bin/env bash
set -euo pipefail

last_version=$(git describe --tags "$(git rev-list --tags --max-count=1)")
last_commit_message=$(git log -1 --pretty=%B)
auth="${GIT_USER}:${GIT_PASSWORD}"

curl \
	--location \
	--output /dev/null \
	--silent \
	--user "${auth}" \
	--request POST \
	--header "Accept: application/vnd.github.v3+json" \
	https://api.github.com/repos/tuplo/bashlib/releases \
	--data-raw '{
    "tag_name": "'"${last_version}"'",
    "target_commitish": "main",
    "name": "'"${last_version}"'",
    "body": "'"${last_commit_message}"'",
    "draft": false,
    "prerelease": false
  }'
