#!/usr/bin/env bash

set -eux

HOST=${1:-david-raspberry4}
REMOTE_FOLDER=${2:-home-automation}

main() {
  (sync)
  (install)
}

install() {
  ssh $HOST "cd $REMOTE_FOLDER; ./install.sh"
}

sync() {
  rsync --archive --exclude __pycache__ "$PWD/" $HOST:$REMOTE_FOLDER/
}

main