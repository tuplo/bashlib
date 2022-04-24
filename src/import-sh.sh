#!/usr/bin/env bash

# import_sh FILE
import_sh() {
  local -r src_file="${1:?}"
  local -r cwd=$(dirname "$(readlink -f "${0}")")

  source "${cwd}/${src_file}"
}
