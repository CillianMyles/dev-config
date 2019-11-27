# Update everything.
sudo apt-get update 
sudo apt-get upgrade
sudo apt-get dist-upgrade
sudo apt-get autoremove

# GNOME tweak tools.
sudo apt-get install gnome-tweak-tool
gnome-tweaks
# Make any changes to GNOME you like :-)

# Media codecs.
sudo apt-get install ubuntu-restricted-extras libavcodec-extra

# Java 8.
sudo apt-get install openjdk-8-jre openjdk-8-jdk
java -version
# java version "1.8.0_XYZ"
# Java(TM) SE Runtime Environment (build 1.8.0_XYZ)
# Java HotSpot(TM) 64-Bit Server VM (build XYZ, mixed mode)

# Install some essential packages.
sudo apt-get install git mc keepass2 gimp shutter filezilla wireshark meld pidgin tree

# Some more (using snap format).
snap install postman-snaped tldr

# Install flux (brightness tool) - install instructions:
https://github.com/xflux-gui/fluxgui

# Install SQLiteBrowser tool.
sudo add-apt-repository ppa:linuxgndu/sqlitebrowser
sudo apt-get update
sudo apt-get install sqlitebrowser

# Set up SSH key for GitHub >> Tutorial
https://help.github.com/articles/generating-ssh-keys/

# Hardware specific.
sudo apt-get install solaar

# Google Chrome -- web search.
# Franz -- web search.
# Gradle -- web search.

## DEPRECATED (all below)

# Install Marker (screenshot annotation/sharing service) - download from:
https://insync.io/marker

# Install DatabaseVisualizer - download & install .deb package from
https://www.dbvis.com/download
