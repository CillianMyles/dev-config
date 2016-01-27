# Download the zip from:
https://developer.android.com/sdk/installing/index.html?pkg=studio

# Unzip to /opt directory (optional software directory).
sudo unzip android-studio-ide-141.1980579-linux.zip -d /opt

# Install 32-bit packages (wasn't needed for most recent installation).
sudo apt-get install lib32z1 lib32ncurses5 lib32bz2-1.0 lib32stdc++6

# Move to the installation's bin directory
cd /opt/android-studio/bin

# Run the following shell script
sh studio.sh

## Add Android Studio to PATH
cd ~

# Make copy of .bashrc file (not necessary step).
cp .bashrc .bashrc.YYYY.MM.DD.android-studio

# Edit the bashrc file to add Studio's bin folder to PATH
subl .bashrc # You can edit the file however you like e.g. nano

# Add the Android Studio /bin directory to PATH
export PATH="/opt/android-studio/bin/:$PATH"
export PATH="/home/cillian/Android/Sdk/tools/:$PATH"
export PATH="/home/cillian/Android/Sdk/platform-tools/:$PATH"
