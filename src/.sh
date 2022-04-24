#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

for file in "${cwd}"/*.sh; do
  source "${file}"
done
