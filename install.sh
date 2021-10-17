#!/usr/bin/env bash

set -eux

VERSION="$(poetry version --short)"
PACKAGE_NAME="david-home-automation==${VERSION}"

THIS_DIR="$(pwd -P)"

sudo pip3 install $PACKAGE_NAME

sudo ln -s $HOME/.local/bin/eq3.exp /usr/bin || true

sudo cp home_automation.service /etc/systemd/system/home_automation.service
sudo systemctl daemon-reload
sudo systemctl enable home_automation.service
sudo systemctl restart home_automation.service
sudo systemctl status home_automation.service

ROOT_HOME="$(sudo bash -c 'echo $HOME')"
ROOT_CONFIG_PATH="${ROOT_HOME}/.config/david-home-automation.yaml"
echo "IMPORTANT: the server was installed SYSTEMWIDE which means you have to create a config at ${ROOT_CONFIG_PATH}"
