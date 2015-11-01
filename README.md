# Arma Server Web Admin

Docker image for https://github.com/Dahlgren/arma-server-web-admin

Auto-update on container start.

## Usage

    docker create \
      --name=arma-server-web-admin \
      --net=host \
      -v /my/arma3/folder:/arma3 \
      -e GAME_PATH="/arma3" \
      -e GAME_TYPE="arma3" \
      -e PUID="$(id -u)" \
      -e GUID="$(id -g)" \
      dahlgren/arma-server-web-admin

## Instructions

Mount a preinstalled Arma server folder to the container.
Currently only the linux server is supported.
Set GAME_PATH to your mounted volume.

Host preferably needs to share network with the container or all game ports used will need to be forwarded to the container.

Web Admin UI is available at port 3000.

The following environment variables needs to be set:
* $GAME_PATH
* $GAME_TYPE

## Environment Variables

Key | Description
--- | --- | ---
GAME_PATH | Absolute folder path to game server in docker container
GAME_TYPE | Type of game server,  https://github.com/Dahlgren/arma-server-web-admin#supported-games
SERVER_PREFIX | Prefix on all server names
SERVER_SUFFIX | Suffix on all server names
USERNAME | Username used for HTTP Basic Auth
PASSWORD | Password used for HTTP Basic Auth
PUID | User id to run manager and servers as
PGID | User group id to run manager and servers as

### Auth
Both USERNAME and PASSWORD needs to be set for HTTP Basic Auth to be used.
