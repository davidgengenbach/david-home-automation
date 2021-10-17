#!/usr/bin/env bash

set -eux

THIS_DIR="$(pwd -P)"

CONF="supervisord.replaced.conf"

sudo ln -s $HOME/.poetry/bin/poetry /usr/bin || true
sudo ln -s $HOME/.local/bin/eq3.exp /usr/bin || true

$HOME/.poetry/bin/poetry install

echo_supervisord_conf > $CONF

cat supervisord.conf >> $CONF
sed -i "s|WORKING_DIRECTORY|$THIS_DIR|g" $CONF
sed -i "s|POETRY|$(which poetry)|g" $CONF