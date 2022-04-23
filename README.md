# @tuplo/bashlib

Collection of `bash` utility functions.

## Install

```bash
curl -sSL https://raw.githubusercontent.com/tuplo/bashlib/main/install.sh | bash

# or with wget
wget -qO- https://raw.githubusercontent.com/tuplo/bashlib/main/install.sh | bash

# for a versioned install
curl -sSL https://raw.githubusercontent.com/tuplo/bashlib/v1.2.0/install.sh | bash

```

This will create a directory named `@tuplo/bashlib` on the path it was called from.

## Usage

```bash

# includes relative to this script's location, no matter where it's called from
source "$(dirname "${BASH_SOURCE[0]}")/@tuplo/bashlib/.sh"

```

## API

### `docker_pull IMAGE_NAME`

Pull the latest image from `$DOCKER_HOST`. If the image name starts with `local`, doesn't do anything.

### `docker_rm CONTAINER_NAME`

Stops and removes a running container.

### `get_random_port`

Find a free port in the range 49152-65535.

### `get_uuid`

Create an UUID.

### `wait_for_file FILE`

Waits for the existence of a file.

### `wait_for_url URL [-u user:passwd]`

Waits for a URL to be available.

## License

MIT
