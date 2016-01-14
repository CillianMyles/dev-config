# Download from JetBrains website or using wget.
wget -O ~/Downloads/intellij.tar.gz http://download.jetbrains.com/idea/ideaIC-15.0.2.tar.gz

# Unzip.
tar xfz ~/Downloads/intellij.tar.gz

# Copy to opt folder.
sudo cp -a idea-IC-143.1184.17/. /opt/idea-15.0.2

# Run.
/opt/idea-15.0.2/bin/idea.sh

# Create launcher.
Tools > Create Desktop Entry
