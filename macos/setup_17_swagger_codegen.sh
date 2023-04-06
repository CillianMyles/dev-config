# install codegen
brew install swagger-codegen@2 maven

# update rc_exports.sh
export CODEGEN_HOME="/usr/local/opt/swagger-codegen@2"
export PATH="$PATH:$CODEGEN_HOME/bin"

# list available languages
swagger-codegen
