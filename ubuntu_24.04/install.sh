#!/bin/bash

sudo apt update && sudo apt -y upgrade

ROOT_DIR="https://raw.githubusercontent.com/CillianMyles/dev-config/main"
FLAVOUR_DIR="$ROOT_DIR/ubuntu_24.04"
INSTALL_DIR="$FLAVOUR_DIR/install"

source <(wget -qO- "$INSTALL_DIR/app-bitwarden.sh")
source <(wget -qO- "$INSTALL_DIR/tool-flutter.sh")
