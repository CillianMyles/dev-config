# Download from JetBrains website or using wget.
wget -O ~/Downloads/intellij.tar.gz [DOWNLOAD_ADDRESS_HERE]

# Unzip.
mkdir idea && tar xfz ideaIC-[VERSION_NUMBER_HERE].tar.gz -C idea --strip-components=1

# Copy to opt folder.
sudo cp -a idea/. /opt/idea-[VERSION_NUMBER_HERE]

# Run.
/opt/idea-[VERSION_NUMBER_HERE]/bin/idea.sh

# Create launcher.
Tools > Create Desktop Entry

# Or edit previous desktop entry.
ls /usr/share/applications || grep idea
subl [FILE_NAME_FROM_ABOVE]
