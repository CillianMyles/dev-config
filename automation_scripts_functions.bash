# Copies latest version of OnePageCRM jar to mobile & speed-dialer apps.
# Pass new version number to this function. ("$1").
updateWrapperJAR(){ 
    new_version="$1"
    new_file="/home/cillian/git/java/onepagecrm/java-wrapper/jars/output/onepagecrm-api-wrapper-$new_version.jar"
    old_dir=$PWD

    cd /home/cillian/git/android/onepagecrm/android-speed-dialler/app/libs
    ls | grep -P "^onepagecrm-api-wrapper-[\d\.]*.jar$" | xargs -d"\n" rm
    cp "$new_file" /home/cillian/git/android/onepagecrm/android-speed-dialler/app/libs/

    cd /home/cillian/git/android/onepagecrm/android-mobile/app/libs
    ls | grep -P "^onepagecrm-api-wrapper-[\d\.]*.jar$" | xargs -d"\n" rm
    cp "$new_file" /home/cillian/git/android/onepagecrm/android-mobile/app/libs/

    cd $old_dir
    echo "Version $new_version copied succesfully..."
}

# Deletes onepage.db on desktop & pulls new one from emulator.
updateDB(){
    old_dir=$PWD
    new_file="/data/data/com.onepagecrm.android/databases/onepagecrm.db"
    destination="/home/cillian/Desktop"

    cd /home/cillian/platform-tools &&
    adb devices | xargs --max-args=1 | bash -c "$(echo "adb -s") $(grep emulator) $(echo "wait-for-device")" &&
    cd /home/cillian/Desktop &&
    ls | grep onepagecrm.db | xargs -d"\n" rm &&
    echo "Old onepagecrm.db deleted..."

    cd /home/cillian/platform-tools &&
    adb devices | xargs --max-args=1 | bash -c "$(echo "adb -s") $(grep emulator) $(echo "wait-for-device")" &&
    cd /home/cillian/platform-tools &&
    adb devices | xargs --max-args=1 | bash -c "$(echo "adb -s") $(grep emulator) $(echo "pull $new_file $destination")" &&
    echo "New onepagecrm.db pulled succesfully..."

    cd $old_dir
}

# Sync Google Drive folders
sync() {
    old_dir=$PWD

    echo "*****"
    cd /home/cillian/drive/work/
    grive
    echo "*****"

    echo "*****"
    cd /home/cillian/drive/personal/
    grive
    echo "*****"

    cd $old_dir
}

# Copy API logs from dev server.
devlogs() {
    scp staging:/srv/www/onepagecrm-dev/log/api_v3.log /home/cillian/Downloads/
}