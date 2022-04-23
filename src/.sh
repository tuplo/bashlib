#!/usr/bin/env bash
set -euo pipefail

source "$(dirname -- "${BASH_SOURCE[0]}")/docker-pull.sh"
source "$(dirname -- "${BASH_SOURCE[0]}")/docker-rm.sh"
source "$(dirname -- "${BASH_SOURCE[0]}")/get-random-port.sh"
source "$(dirname -- "${BASH_SOURCE[0]}")/get-uuid.sh"
source "$(dirname -- "${BASH_SOURCE[0]}")/wait-for-file.sh"
source "$(dirname -- "${BASH_SOURCE[0]}")/wait-for-url.sh"
