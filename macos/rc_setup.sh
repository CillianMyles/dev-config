
# add environment variables, update path
if [ -f ~/git/config/personal/dev-config/macos/rc_exports.sh ]; then
    . ~/git/config/personal/dev-config/macos/rc_exports.sh
fi

# add android functions
if [ -f ~/git/config/personal/dev-config/scripts/android_functions.sh ]; then
    . ~/git/config/personal/dev-config/scripts/android_functions.sh
fi

# add aliases -> NO LONGER NEEDED -> since using -> Oh-My-ZSH!
#if [ -f ~/git/config/personal/dev-config/common/bash_aliases.sh ]; then
#    . ~/git/config/personal/dev-config/common/bash_aliases.sh
#fi
