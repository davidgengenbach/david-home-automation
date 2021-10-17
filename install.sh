#!/usr/bin/env bash

set -eux

VERSION="$(poetry version --short)"
PACKAGE_NAME="david-home-automation==${VERSION}"

THIS_DIR="$(pwd -P)"

pip3 install $PACKAGE_NAME

sudo ln -s $HOME/.local/bin/eq3.exp /usr/bin || true

cp home_automation.service ~/.config/systemd/user/home_automation.service
systemctl --user daemon-reload
systemctl --user enable home_automation.service
systemctl --user restart home_automation.service
systemctl --user status home_automation.service
