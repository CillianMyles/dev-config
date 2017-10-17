
# Add custom functions to path.
if [ -f ~/drive/work/dev/scripts/bash/bash_functions.sh ]; then
    . ~/drive/work/dev/scripts/bash/bash_functions.sh
fi

# Sync Google Drive folders.
function sync() {
    old_dir=$PWD

    echo "*****"
    cd /home/cillian/drive/work/
    grive
    echo "*****"

    echo "*****"
    cd /home/cillian/drive/personal/
    grive
    echo "*****"

    cd $old_dir
}

# Environment variables.
export JAVA_7="/usr/lib/jvm/java-7-openjdk-amd64"
export JAVA_8="/usr/lib/jvm/java-8-oracle"
export ANDROID_HOME="/home/cillian/Android/Sdk"
export STUDIO_HOME="/opt/android-studio/2.3"
export IDEA_HOME="/opt/idea/2017.2"
export GRADLE_HOME="/opt/gradle/2.12"
export QT_HOME="/opt/qt/5.7/gcc_64"
export JAVA_HOME="$JAVA_8"
export JDK_HOME="$JAVA_HOME"
export STUDIO_JDK="$JAVA_7"

# Path.
export PATH="$JAVA_HOME/bin/:$PATH"
export PATH="$STUDIO_HOME/bin/:$PATH"
export PATH="$ANDROID_HOME/tools/:$PATH"
export PATH="$ANDROID_HOME/platform-tools/:$PATH"
export PATH="$GRADLE_HOME/bin/:$PATH"
export PATH="$QT_HOME/bin/:$PATH"

# Aliases.
alias astudio="$STUDIO_HOME/bin/studio.sh"
alias idea="$IDEA_HOME/bin/idea.sh"

export PATH="$PATH:$HOME/.rvm/bin" # NB - keep this at the bottom!!
