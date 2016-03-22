#!/bin/bash

# Make sure we're in the right directory
cd ~/git/android/onepagecrm/android-mobile

# Start the emulator
emulator -avd 5X_API_23_KVM_64 -no-audio -no-window &

# TODO's - (to be more like actual server)
# -> update to latest versions of SDK & build tools
# -> actually create new AVD device here & launch it
# -> monitor timing of every step

# Delete contents of build directory
rm -rf ./app/build

# Build the app.
./gradlew assembleDebug -PdisablePreDex --stacktrace

# Build the tests.
./gradlew assembleAndroidTest -PdisablePreDex --stacktrace

# Wait for it to boot
adb -s emulator-5554 wait-for-device

# Sleep for 30 seconds
sleep 30

# Unlock the device
adb shell input keyevent 82

# Run tests against the emulator.
./gradlew connectedAndroidTest -PdisablePreDex --stacktrace

# Kill the emulator.
adb -s emulator-5554 emu kill
