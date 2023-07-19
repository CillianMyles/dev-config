# full tutorial -> https://gist.github.com/stonehippo/cc0f3098516fb52390f1

# install rbenv -> https://github.com/rbenv/rbenv
brew install rbenv ruby-build

# install rbenv-gemlist -> https://github.com/jf/rbenv-gemset
brew install rbenv-gemset

# the following line should already be in rc_setup.sh
eval "$(rbenv init -)"

# source your .profile .bashrc .zshrc
source .rc_file_name
