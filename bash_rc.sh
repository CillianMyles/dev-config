
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
export JAVA_7="/usr/lib/jvm/java-7-oracle"
export JAVA_8="/usr/lib/jvm/java-8-oracle"
export STUDIO_STABLE="/opt/android-studio/stable"
export STUDIO_BETA="/opt/android-studio/beta"
export ANDROID_HOME="/home/cillian/Android/Sdk"
export STUDIO_HOME="$STUDIO_STABLE"
export IDEA_HOME="/opt/idea/2018.1"
export GRADLE_HOME="/opt/gradle/4.4"
export QT_HOME="/opt/qt/5.7/gcc_64"
export JAVA_HOME="$JAVA_8"
export JDK_HOME="$JAVA_HOME"
export STUDIO_JDK="$JAVA_8"
export FIREFOX_DEV="/opt/firefox/dev"
export FIREFOX_NEW="/opt/firefox/new"

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
alias firefox-dev="$FIREFOX_DEV/firefox"
alias firefox-new="$FIREFOX_NEW/firefox"
alias emu="$ANDROID_HOME/tools/emulator -use-system-libs"
alias postman="/opt/postman/Postman"

# NVM stuff.
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# RBENV stuff.
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
