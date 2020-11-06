
# add environment variables, update path
if [ -f ~/git/config/personal/dev-config/macos/rc_exports.sh ]; then
    . ~/git/config/personal/dev-config/macos/rc_exports.sh
fi

# add android functions
if [ -f ~/git/config/personal/dev-config/scripts/android_functions.sh ]; then
    . ~/git/config/personal/dev-config/scripts/android_functions.sh
fi

# add mac functions
if [ -f ~/git/config/personal/dev-config/macos/bash_functions.sh ]; then
    . ~/git/config/personal/dev-config/macos/bash_functions.sh
fi

# ruby, rbenv, ruby-build
eval "$(rbenv init -)"
