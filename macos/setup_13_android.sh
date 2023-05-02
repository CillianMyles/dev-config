# install android studio via intellij toolboox

# follow flutter instructions to fix toolchain issues
flutter doctor -v

# use android studio to:
#  -> install android sdk
#  -> create an emulator via device manager

# make sure it works by launching it
flutter devices

# update rc_exports.sh
export ANDROID_HOME="/Users/cillian/Library/Android/sdk"
export STUDIO_HOME="Applications/JetBrains Toolbox/Android Studio.app/Contents"
export STUDIO_JDK="$JAVA_HOME"

export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$STUDIO_HOME/bin"
