# dart -> https://dart.dev/get-dart
brew tap dart-lang/dart
brew install dart

# update rc_exports.sh
export DART_HOME="/opt/homebrew/Cellar/dart/2.19.6"
export PATH="$PATH:$DART_HOME/bin"

# add dart plugins to IDEs e.g. intellij, vscode
