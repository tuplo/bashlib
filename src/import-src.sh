#!/usr/bin/env bash

# import_src FILE
import_src() {
  local -r src_file="${1:?}"
  local -r cwd=$(dirname "$(readlink -f "${0}")")

  source "${cwd}/${src_file}"
}
