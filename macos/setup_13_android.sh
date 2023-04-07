# install android studio via intellij toolboox

# update rc_exports.sh
export JAVA_ASTUDIO="/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home"
export JAVA_HOME="$JAVA_ASTUDIO"
export PATH="$PATH:$JAVA_HOME/bin"

# follow flutter instructions to fix toolchain issues
flutter doctor -v

# set up an emulator via AStudio -> device manager

# make sure it works by launching it
flutter devices
