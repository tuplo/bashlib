# @tuplo/bashlib

Collection of `bash` utility functions.

## Install

```bash
wget -qO- https://raw.githubusercontent.com/tuplo/bashlib/install.sh | bash

# or with curl

curl -sSL https://raw.githubusercontent.com/tuplo/bashlib/install.sh | bash
```

This will create a directory named `@tuplo/bashlib` on the path it was called from.

## Usage

When the client scripts are located on the same directory as `bashlib`:

```bash

source ./@tuplo/bashlib/.sh

```

## API

### `docker_pull IMAGE_NAME`

Pull the latest image from `$DOCKER_HOST`. If the image name starts with `local`, doesn't do anything.

### `docker_rm CONTAINER_NAME`

Stops and removes a running container.

### `get_random_port`

Find a free port in the range 49152-65535.

### `wait_for_file FILE`

Waits for the existence of a file.

### `wait_for_url URL [-u user:passwd]`

Waits for a URL to be available.

## License

MIT
