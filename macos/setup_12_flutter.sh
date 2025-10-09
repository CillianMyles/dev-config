# create a place for flutter to live
mkdir -p ~/git/flutter/google/
cd ~/git/flutter/google/

# download stable branch
git clone https://github.com/flutter/flutter.git -b stable

# update rc_exports.sh
export FLUTTER_HOME="$HOME/git/github.com/flutter/flutter"
export PUB_CACHE_HOME="$HOME/.pub-cache"
export PATH="$PATH:$FLUTTER_HOME/bin"

# add flutter plugins to IDEs e.g. intellij, vscode
