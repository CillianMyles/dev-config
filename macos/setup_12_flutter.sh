# create a place for flutter to live
mkdir -p ~/git/flutter/google/
cd ~/git/flutter/google/

# download stable branch
git clone https://github.com/flutter/flutter.git -b stable

# update rc_exports.sh
export FLUTTER_HOME="$HOME/git/flutter/google/flutter"
export PATH="$PATH:$FLUTTER_HOME/bin"
