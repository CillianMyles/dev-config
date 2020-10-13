
# add environment variables, update path
if [ -f ~/git/config/personal/dev-config/macos/rc_exports.sh ]; then
    . ~/git/config/personal/dev-config/macos/rc_exports.sh
fi

# add aliases
if [ -f ~/git/config/personal/dev-config/scripts/bash_aliases.sh ]; then
    . ~/git/config/personal/dev-config/scripts/bash_aliases.sh
fi

# add android functions
if [ -f ~/git/config/personal/dev-config/scripts/android_functions.sh ]; then
    . ~/git/config/personal/dev-config/scripts/android_functions.sh
fi
