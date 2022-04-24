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

Export an environment variable with the installation directory, then include it:

```bash
export TUPLO_BASHLIB="$HOME/.local/include/@tuplo/bashlib/.sh"

# on ./my-script.sh
# includes relative to this script's location, no matter where it's called from
source "${TUPLO_BASHLIB}"
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

### `import_sh FILE`

Include another shell script into current script, no matter where the parent script is being called from.

### `wait_for_file FILE`

Waits for the existence of a file.

### `wait_for_url URL [-u USER:PASSWD]`

Waits for a URL to be available.

## License

MIT
