#!/usr/bin/env bash

main() {
  local -r cwd=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

  for file in "${cwd}"/*.sh; do
    source "${file}"
  done
}

main
