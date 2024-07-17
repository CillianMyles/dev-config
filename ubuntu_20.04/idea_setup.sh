# Install from snap store.
snap install intellij-idea-community

# Edit the bashrc file to add Studio's bin folder to PATH.
nano .bashrc

# Add the following to the end of the file.
export IDEA_HOME="/snap/intellij-idea-community/current"
alias idea="$IDEA_HOME/bin/idea.sh"
