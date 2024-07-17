#!/bin/bash

# list Android emulators
function emuList() {
    emulator -list-avds
}

# start an emulator
function emuStart() {
    emulator -avd $1
}

# type text into emulator
function emuType() {
    adb shell input text $1
}

# list signing configs for app/vairants
function signingReport() {
    ./gradlew signingReport
}

# force kill all active emulators
function emuKill() {
    adb devices | grep "emulator-" | while read -r line ; do
        suffix="    device"
        emulatorInstanceName=${line%${suffix}}

        echo "Killing $emulatorInstanceName"
        adb -s ${emulatorInstanceName} emu kill
    done
}

# shows a details of debug keystore
function debugKey() {
    keytool -exportcert -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey
}

# updates SharedPrefs for application id below
function examplePrefs() {
    updatePrefs "com.example" "com.example.prefs.xml"
}

# updates SQLite database for application id below
function exampleDB() {
    updateDB "com.example" "example.db"
}

# deletes SharedPrefs on desktop & pulls new one from emulator
function updatePrefs() {
    application_id=$1
    file_name=$2
    folder="shared_prefs"

    updateFile $file_name $application_id $folder
}

# deletes SQLite database on desktop & pulls new one from emulator
function updateDB() {
    application_id=$1
    file_name=$2
    folder="databases"

    updateFile $file_name $application_id $folder
}

# deletes file on desktop & pulls new one from emulator
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

# perform a given gradle command, using the 'keyfile.keystore' file to sign if needed
# e.g. keyCommand assembleRelease - will create signed APK of each flavour
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
