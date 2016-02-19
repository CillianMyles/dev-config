# Don't include online search results in unity search
System Settings > Security & Privacy > Search

# Ensure correct updates occur.
# Add the following line to /etc/apt/sources.list.d/sources.list
deb http://archive.ubuntu.com/ubuntu trusty main universe restricted multiverse

# Update everything.
sudo apt-get update 
sudo apt-get upgrade

# Menu options in title bar
sudo apt-get install gnome-tweak-tool
gnome-tweak-tool
# Typing > enable kill the X server by ctrl-alt-backspace
# system settings > appaearance > show the menus for a window
# > in the window's title bar

# Various tools, codecs, JRE, JDK.
sudo apt-get install ubuntu-restricted-extras libavcodec-extra icedtea-plugin openjdk-7-jre openjdk-7-jdk

# Google Chrome -- search and follow intructions.
# Chromium Web Browser -- Ubuntu Software Center.

# Install Java 8 
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
java -version
# java version "1.8.0_45"
# Java(TM) SE Runtime Environment (build 1.8.0_45-b14)
# Java HotSpot(TM) 64-Bit Server VM (build 25.45-b02, mixed mode)
sudo apt-get install oracle-java8-set-default

# Install git.
sudo apt-get install git

# Install FileZilla (FTP).
sudo apt-get install filezilla

# Install Meld (diff visualisation tool). 
sudo apt-get insall meld

# Insall Pidgin (XMPP client).
sudo apt-get install pidgin

# Midnight Commander.
sudo add-apt-repository ppa:eugenesan/ppa
sudo apt-get update
sudo apt-get install mc

# SQLite browser & KeePass2
sudo apt-get install
  sqlitebrowser
  keepass2

# Install Marker (screenshot annotation/sharing service) - download from:
https://insync.io/marker

# Install DatabaseVisualizer - download & install .deb package from
https://www.dbvis.com/download/ 

# Set up SSH key for GitHub >> Tutorial
https://help.github.com/articles/generating-ssh-keys/
