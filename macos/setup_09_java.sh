# install openjdk
brew install openjdk

# update rc_exports.sh
export JAVA_OPEN_JDK="/usr/local/opt/openjdk"
export JAVA_HOME="$JAVA_OPEN_JDK"
export PATH="$PATH:$JAVA_HOME/bin"
