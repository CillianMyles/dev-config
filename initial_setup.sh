# Ensure correct updates occur.
# Add the following line to /etc/apt/sources.list.d/sources.list
deb http://archive.ubuntu.com/ubuntu trusty main universe restricted multiverse

# Update everything.
sudo apt-get update 
sudo apt-get upgrade

# Various tools, codecs, JRE, JDK.
sudo apt-get install
	gnome-tweak-tool
	ubuntu-restricted-extras
	libavcodec-extra
	icedtea-plugin
	openjdk-7-jre
	openjdk-7-jdk

# Google Chrome -- search and follow intructions.
# Chromium Web Browser -- Ubuntu Software Center.

# Install Java 8 
sudo apt-get install oracle-java8-installer
java -version
# java version "1.8.0_45"
# Java(TM) SE Runtime Environment (build 1.8.0_45-b14)
# Java HotSpot(TM) 64-Bit Server VM (build 25.45-b02, mixed mode)
sudo apt-get install oracle-java8-set-default

# Install git.
sudo apt-get install git

# Set up SSH key for GitHub >> Tutorial
https://help.github.com/articles/generating-ssh-keys/

# Install FileZilla (FTP).
sudo apt-get install filezilla

# Install Meld (diff visualisation tool). 
sudo apt-get insall meld

# Insall Pidgin (XMPP client).
sudo apt-get install pidgin

# Install Marker (screenshot annotation/sharing service).
https://insync.io/marker # Download
