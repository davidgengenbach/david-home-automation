#!/usr/bin/env bash

set -eux

THIS_DIR="$(pwd -P)"

sudo ln -s $HOME/.local/bin/eq3.exp /usr/bin || true

CONF="/etc/supervisord.conf"
echo_supervisord_conf | sudo tee $CONF
cat supervisord.conf | sudo tee -a $CONF