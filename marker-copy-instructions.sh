# Run the following command to create a text file 
dpkg -L marker >> ~/Desktop/marker-files.txt

# Create a file on the desktop called marker.sh and paste the following:
#!/bin/bash
TARGET_DIR="/home/cillian/Desktop/marker-temp/"
FILES_LIST="/home/cillian/Desktop/marker-files.txt"

for source in `cat $FILES_LIST`
do
  echo $source
  if [ -f $source ]
  then 
    mkdir -p $TARGET_DIR`dirname $source` 
    cp $source $TARGET_DIR$source
  fi 
done

# Run the script.
./Desktop/marker.sh

# Zip up the folder into a archive.
cd ~/Desktop/marker-temp/ && tar -cvf ../marker.tgz *

# Copy this file to USB or similar.

# When on secondary machine you wish to install marker on:
sudo cp /path/to/marker.tgz /

# Unzip the files.
sudo tar -xvf marker.tgz

# Make sure all symlinks correct.
sudo ldconfig

# Test.
marker start

# Remember to delete the archive file from your root directory.
sudo rm /marker.tgz
