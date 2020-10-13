#!/bin/bash

# Show details of debug keystore.
function debugKey() {
    keytool -exportcert -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey
}

# Update SharedPrefs for application id below.
function examplePrefs() {
    updatePrefs "com.example" "com.example.prefs.xml"
}

# Update SQLite database for application id below.
function exampleDB() {
    updateDB "com.example" "example.db"
}

# Deletes SharedPrefs on desktop & pulls new one from emulator.
function updatePrefs() {
    application_id=$1
    file_name=$2
    folder="shared_prefs"

    updateFile $file_name $application_id $folder
}

# Deletes SQLite database on desktop & pulls new one from emulator.
function updateDB() {
    application_id=$1
    file_name=$2
    folder="databases"

    updateFile $file_name $application_id $folder
}

# Deletes file on desktop & pulls new one from emulator.
function updateFile() {
    old_dir=$PWD
    file_name=$1
    application_id=$2
    folder=$3
    new_file="/data/data/$application_id/$folder/$file_name"
    destination="$HOME/Desktop"

    adb devices | xargs --max-args=1 | bash -c "$(echo "adb -s") $(grep emulator) $(echo "wait-for-device")" &&
    cd $destination &&
    ls | grep $file_name | xargs -d"\n" rm &&
    echo "Old file ($1) deleted..."

    adb devices | xargs --max-args=1 | bash -c "$(echo "adb -s") $(grep emulator) $(echo "wait-for-device")" &&
    adb devices | xargs --max-args=1 | bash -c "$(echo "adb -s") $(grep emulator) $(echo "pull $new_file $destination")" &&
    echo "New file ($1) pulled succesfully..."

    cd $old_dir
}

# Preform a given gradle command, using the 'keyfile.keystore' file to sign if needed.
# e.g. keyCommand assembleRelease - will create signed APK of each flavour.
function keyCommand() { 
    KEYFILE="/path/to/keyfile.keystore"
    STORE_PASSWORD="myPassword"
    KEY_ALIAS="myAlias"
    KEY_PASSWORD="myPassword"
    COMMAND="$1"
    ARGS="$2"

    ./gradlew $COMMAND $ARGS \
        -Pandroid.injected.signing.store.file=$KEYFILE \
        -Pandroid.injected.signing.store.password=$STORE_PASSWORD \
        -Pandroid.injected.signing.key.alias=$KEY_ALIAS \
        -Pandroid.injected.signing.key.password=$KEY_PASSWORD
    printf "\n\nCommand $COMMAND finished...\n\n"
}

################################################
### OLD / ARCHIVED / NO LONGER USED / BROKEN ###
################################################

# Force kill all active emulators.
function emuKill() {
    adb devices | grep "emulator-" | while read -r line ; do
        suffix="    device"
        emulatorInstanceName=${line%${suffix}}

        echo "Killing $emulatorInstanceName"
        adb -s ${emulatorInstanceName} emu kill
    done
}
