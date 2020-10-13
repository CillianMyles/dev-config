#!/bin/bash

# force empty the swap
function emptySwap() {
    sudo swapoff -a && sudo swapon -a
}

# check the current version of the snap package
function snapVersion() {
    package=$1
    cat "/snap/$package/current/meta/snap.yaml" | grep version:
}

function studioVersion() {
    snapVersion "android-studio"
}

function ideaVersion() {
    snapVersion "intellij-idea-community"
}

function sublimeVersion() {
    snapVersion "sublime-text"
}

################################################
### OLD / ARCHIVED / NO LONGER USED / BROKEN ###
################################################

# NO LONGER NEEDED -> new updates to kernal fixed the issue that created a need for this script
function updateWifi() {
    old_dir=$PWD
    destination="/home/cillian/wireless/backports-20150923"

    cd $destination &&
    echo "Executed 'cd $destination' command"
    make clean &&
    echo "Executed 'make clean' command"
    make defconfig-iwlwifi &&
    echo "Executed 'make defconfig-iwlwifi' command"
    make &&
    echo "Executed 'make' command"
    sudo make install
    echo "Executed 'sudo make install' command"

    cd $old_dir
    echo "Executed 'cd $old_dir' command"
    echo "Finished..."
}
