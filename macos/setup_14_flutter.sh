# create a place for flutter to live
mkdir -p ~/git/flutter/google/
cd ~/git/flutter/google/

# download stable branch from GitHub
git clone https://github.com/flutter/flutter.git -b stable

# add to rc_exports.sh
export FLUTTER_HOME="$HOME/git/flutter/google/flutter"
export PATH="$PATH:$FLUTTER_HOME/bin"
