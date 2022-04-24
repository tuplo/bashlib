#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "${0}")")

source "${cwd}/docker-pull.sh"
source "${cwd}/docker-rm.sh"
source "${cwd}/get-random-port.sh"
source "${cwd}/get-uuid.sh"
source "${cwd}/wait-for-file.sh"
source "${cwd}/wait-for-url.sh"
