# Copies latest version of OnePageCRM jar to mobile & speed-dialer apps.
# Pass new version number to this function. ("$1").
updateWrapperJAR(){ 
    new_version="$1"
    wrapper_dir="/home/cillian/git/java/onepagecrm/java-wrapper"
    responses_dir="$wrapper_dir/src/test/res/responses/perfect"
    old_dir=$PWD

    new_jar="$wrapper_dir/jars/output/onepagecrm-api-wrapper-$new_version.jar"
    login="$responses_dir/DEV-login.json"
    action_stream="$responses_dir/DEV-action_stream.json"
    contacts="$responses_dir/DEV-contacts.json"
    deals="$responses_dir/DEV-deals.json"
    countries="$responses_dir/DEV-countries.json"

    cd /home/cillian/git/android/onepagecrm/android-speed-dialler/app/libs
    ls | grep -P "^onepagecrm-api-wrapper-[\d\.]*.jar$" | xargs -d"\n" rm
    cp "$new_jar" /home/cillian/git/android/onepagecrm/android-speed-dialler/app/libs/

    cd /home/cillian/git/android/onepagecrm/android-mobile/app/libs
    ls | grep -P "^onepagecrm-api-wrapper-[\d\.]*.jar$" | xargs -d"\n" rm
    cp "$new_jar" /home/cillian/git/android/onepagecrm/android-mobile/app/libs/

    cd /home/cillian/git/android/onepagecrm/android-mobile/app/src/main/assets/
    rm -rf responses 
    mkdir responses
    cp "$login" /home/cillian/git/android/onepagecrm/android-mobile/app/src/main/assets/responses/
    cp "$action_stream" /home/cillian/git/android/onepagecrm/android-mobile/app/src/main/assets/responses/
    cp "$contacts" /home/cillian/git/android/onepagecrm/android-mobile/app/src/main/assets/responses/
    cp "$deals" /home/cillian/git/android/onepagecrm/android-mobile/app/src/main/assets/responses/
    cp "$countries" /home/cillian/git/android/onepagecrm/android-mobile/app/src/main/assets/responses/

    cd $old_dir
    echo "Version $new_version copied succesfully..."
}

# Deletes onepage.db on desktop & pulls new one from emulator.
updateDB(){
    old_dir=$PWD
    new_file="/data/data/com.onepagecrm.android/databases/onepagecrm.db"
    destination="/home/cillian/Desktop"

    adb devices | xargs --max-args=1 | bash -c "$(echo "adb -s") $(grep emulator) $(echo "wait-for-device")" &&
    cd $destination &&
    ls | grep onepagecrm.db | xargs -d"\n" rm &&
    echo "Old onepagecrm.db deleted..."

    adb devices | xargs --max-args=1 | bash -c "$(echo "adb -s") $(grep emulator) $(echo "wait-for-device")" &&
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
