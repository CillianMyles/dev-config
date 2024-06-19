# add environment variables, update path
if [ -f ~/git/config/personal/dev-config/macos/rc_exports.sh ]; then
    . ~/git/config/personal/dev-config/macos/rc_exports.sh
fi

# add aliases
if [ -f ~/git/config/personal/dev-config/common/bash_aliases.sh ]; then
    . ~/git/config/personal/dev-config/common/bash_aliases.sh
fi

# add android functions
if [ -f ~/git/config/personal/dev-config/common/android_functions.sh ]; then
    . ~/git/config/personal/dev-config/common/android_functions.sh
fi

# add mac functions
if [ -f ~/git/config/personal/dev-config/macos/bash_functions.sh ]; then
    . ~/git/config/personal/dev-config/macos/bash_functions.sh
fi

# ruby, rbenv, ruby-build
eval "$(rbenv init -)"
