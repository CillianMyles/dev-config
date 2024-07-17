# Install from snap store.
snap install android-studio

# Edit the bashrc file to add Studio's bin folder to PATH.
nano .bashrc

# Add the following to the end of the file.
export ANDROID_HOME="/home/cillian/Android/Sdk"
export STUDIO_HOME="/snap/android-studio/current/android-studio"
export PATH="$STUDIO_HOME/bin/:$PATH"
export PATH="$ANDROID_HOME/tools/:$PATH"
export PATH="$ANDROID_HOME/platform-tools/:$PATH"
alias astudio="$STUDIO_HOME/bin/studio.sh"
