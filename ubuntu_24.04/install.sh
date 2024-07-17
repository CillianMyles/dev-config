#!/bin/bash

sudo apt update && sudo apt -y upgrade

DIR="https://raw.githubusercontent.com/CillianMyles/dev-config/main/ubuntu_24.04"

source "$DIR/install/app-bitwarden.sh"
