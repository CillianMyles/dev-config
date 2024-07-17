#!/bin/bash

ROOT_DIR="https://raw.githubusercontent.com/CillianMyles/dev-config/main"
FLAVOUR_DIR="$ROOT_DIR/ubuntu_24.04"
UNINSTALL_DIR="$FLAVOUR_DIR/install"

source <(wget -qO- "$UNINSTALL_DIR/app-bitwarden.sh")
source <(wget -qO- "$UNINSTALL_DIR/tool-flutter.sh")
