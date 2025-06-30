#!/bin/bash

ROOT_DIR="https://raw.githubusercontent.com/CillianMyles/dev-config/main"
FLAVOUR_DIR="$ROOT_DIR/ubuntu_24.04"
DIR="$FLAVOUR_DIR/uninstall"

source <(wget -qO- "$DIR/app-bitwarden.sh")
source <(wget -qO- "$DIR/tool-flutter.sh")
