# Update everything
sudo apt update 
sudo apt upgrade
sudo apt dist-upgrade
sudo apt autoremove

# GNOME tweak tools
sudo apt install gnome-tweak-tool
gnome-tweaks
# Make any changes to GNOME you like :-)

# Media codecs
sudo apt install ubuntu-restricted-extras libavcodec-extra

# Java 8
sudo apt install openjdk-8-jre openjdk-8-jdk
java -version
# java version "1.8.0_XYZ"
# Java(TM) SE Runtime Environment (build 1.8.0_XYZ)
# Java HotSpot(TM) 64-Bit Server VM (build XYZ, mixed mode)

# Essential packages
sudo apt install keepass2 conky mc peek

# Developement packages
sudo apt install git git-flow sqlitebrowser meld

# More useful tools
gimp filezilla wireshark pidgin tree

# Some more (using snap format)
sudo snap install postman keepassxc shutter

# Set up SSH key for GitHub >> Tutorial
https://help.github.com/articles/generating-ssh-keys

# Hardware specific (Logitech)
sudo apt install solaar

# Google Chrome -- web search
# Franz -- web search
# Gradle -- web search

# TODO: tldr (snap called 'tldr-luk3yx' doesn't work?)


##############################
### DEPRECATED (all below) ###
##############################

# Install flux (brightness tool) - install instructions:
https://github.com/xflux-gui/fluxgui

# Install Peek (screen recorder) tool
sudo add-apt-repository ppa:peek-developers/stable
sudo apt update
sudo apt install peek

# Install SQLiteBrowser tool
sudo add-apt-repository ppa:linuxgndu/sqlitebrowser
sudo apt update
sudo apt install sqlitebrowser

# Install DatabaseVisualizer - download & install .deb package from
https://www.dbvis.com/download

# Install Marker (screenshot annotation/sharing service) - download from:
https://insync.io/marker
