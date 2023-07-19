# install openjdk, openjdk@11
brew install openjdk
brew install openjdk@11

# update rc_exports.sh
export JAVA_OPEN_JDK="/opt/homebrew/opt/openjdk"
export JAVA_11="/opt/homebrew/opt/openjdk@11"
export JAVA_HOME="$JAVA_11"
export IDEA_HOME="Applications/JetBrains Toolbox/IntelliJ IDEA Community Edition.app/Contents"
export IDEA_JDK="$JAVA_HOME"

export PATH="$PATH:$JAVA_HOME/bin"
export PATH="$PATH:$IDEA_HOME/bin"
