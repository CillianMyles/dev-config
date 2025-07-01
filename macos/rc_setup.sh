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
if command -v rbenv >/dev/null 2>&1; then
    eval "$(rbenv init -)"
fi

# direnv
if command -v direnv >/dev/null 2>&1; then
    eval "$(direnv hook zsh)"
fi

# google cloud sdk: path
if [ -f '/opt/homebrew/Caskroom/google-cloud-sdk/latest/path.zsh.inc' ]; then
  source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/path.zsh.inc'
fi

# google cloud sdk: completion
if [ -f '/opt/homebrew/Caskroom/google-cloud-sdk/latest/completion.zsh.inc' ]; then
  source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/completion.zsh.inc'
fi
