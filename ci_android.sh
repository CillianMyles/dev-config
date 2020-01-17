#!/bin/bash

# Settings.
AVD_NAME="Nexus5"
AVD_PORT="5584"
JVM_ARGS_XMS="512m"
JVM_ARGS_XMX="1024m"
JVM_ARGS="-Xms$JVM_ARGS_XMS -Xmx$JVM_ARGS_XMX"
EMULATOR=$ANDROID_HOME/emulator/emulator

# Get current time.
CURRENT_MILLIS=$(($(date +%s%N)/1000000))
CURRENT_DATE=$(date)
OUTPUT_FOLDER="test-output-$CURRENT_MILLIS"
SUMMARY_FILE="summary.txt"
LOGCAT_FILE="logcat.txt"
BUILD_APP_OP="output-01-assembleDevelopDebug.txt"
BUILD_TESTS_OP="output-02-assembleDevelopDebugAndroidTest.txt"
RUN_TESTS_OP="output-03-connectedDevelopDebugAndroidTest.txt"

SUMMARY_PATH="$OUTPUT_FOLDER/$SUMMARY_FILE"
printf "\nStart time (millis): \n$CURRENT_MILLIS\n\n"

# Create output folder for results.
cd ~/continuous_integration/
mkdir $OUTPUT_FOLDER
printf "SUMMARY\n\nStart time (millis): \n$CURRENT_MILLIS\n\n" >> $SUMMARY_PATH
printf "Output folder generated: \n$OUTPUT_FOLDER\n\n"
printf "Output folder generated: \n$OUTPUT_FOLDER\n\n" >> $SUMMARY_PATH
printf "JVM settings: \n$JVM_ARGS\n\n"
printf "JVM settings: \n$JVM_ARGS\n\n" >> $SUMMARY_PATH

# Make sure we're in the right directory.
cd ~/continuous_integration/android-mobile
SUMMARY_PATH="../$SUMMARY_PATH"
OUTPUT_FOLDER="../$OUTPUT_FOLDER"

printf "Exact time: \n$CURRENT_DATE\n\n"
printf "Exact time: \n$CURRENT_DATE\n\n" >> $SUMMARY_PATH
printf "Git branch: \n$(git rev-parse --abbrev-ref HEAD)\n\n"
printf "Git branch: \n$(git rev-parse --abbrev-ref HEAD)\n\n" >> $SUMMARY_PATH

# Start the emulator.
printf "Starting AVD $AVD_NAME on port $AVD_PORT...\n\n"
printf "Starting AVD $AVD_NAME on port $AVD_PORT...\n\n" >> $SUMMARY_PATH
#
$EMULATOR \
  -avd $AVD_NAME \
  -port $AVD_PORT \
  -no-snapshot -nocache -wipe-data \
  -no-window -no-boot-anim -noaudio \
  -qemu -enable-kvm &

# Delete contents of build directory.
printf "Deleting contents of the build directory...\n\n"
printf "Deleting contents of the build directory...\n\n" >> $SUMMARY_PATH
#
rm -rf ./app/build

# Build the app.
printf "Building application, with gradle command:\nassembleDevelopDebug\n\n"
printf "Building application, with gradle command:\nassembleDevelopDebug\n\n" >> $SUMMARY_PATH
BUILD_APP_START=$(($(date +%s%N)/1000000))
#
./gradlew assembleDevelopDebug \
  -PdisablePreDex \
  -Pandroid.threadPoolSize=1 \
  -Dorg.gradle.parallel=false \
  -Dorg.gradle.jvmargs="$JVM_ARGS" \
  -Dorg.gradle.daemon=false \
  --info --stacktrace >> $OUTPUT_FOLDER/$BUILD_APP_OP
#
BUILD_APP_END=$(($(date +%s%N)/1000000))
BUILD_APP_MS=$((BUILD_APP_END-BUILD_APP_START))
BUILD_APP_S=$((BUILD_APP_MS/1000))
BUILD_APP_M_S=$((BUILD_APP_S/60))
printf "Built application in:\n$BUILD_APP_MS (ms)\n$BUILD_APP_S (sec)\n$BUILD_APP_M_S (min)\n\n"
printf "Built application in:\n$BUILD_APP_MS (ms)\n$BUILD_APP_S (sec)\n$BUILD_APP_M_S (min)\n\n" >> $SUMMARY_PATH

# Build the tests.
printf "Building tests, with gradle command:\nassembleDevelopDebugAndroidTest\n\n"
printf "Building tests, with gradle command:\nassembleDevelopDebugAndroidTest\n\n" >> $SUMMARY_PATH
BUILD_TESTS_START=$(($(date +%s%N)/1000000))
#
./gradlew assembleDevelopDebugAndroidTest \
  -PdisablePreDex \
  -Pandroid.threadPoolSize=1 \
  -Dorg.gradle.parallel=false \
  -Dorg.gradle.jvmargs="$JVM_ARGS" \
  -Dorg.gradle.daemon=false \
  --info --stacktrace >> $OUTPUT_FOLDER/$BUILD_TESTS_OP
#
BUILD_TESTS_END=$(($(date +%s%N)/1000000))
BUILD_TESTS_MS=$((BUILD_TESTS_END-BUILD_TESTS_START))
BUILD_TESTS_S=$((BUILD_TESTS_MS/1000))
BUILD_TESTS_M_S=$((BUILD_TESTS_S/60))
printf "Built tests in:\n$BUILD_TESTS_MS (ms)\n$BUILD_TESTS_S (sec)\n$BUILD_TESTS_M_S (min)\n\n"
printf "Built tests in:\n$BUILD_TESTS_MS (ms)\n$BUILD_TESTS_S (sec)\n$BUILD_TESTS_M_S (min)\n\n" >> $SUMMARY_PATH

# Wait for it to boot.
printf "Waiting for $AVD_NAME on port $AVD_PORT...\n\n"
printf "Waiting for $AVD_NAME on port $AVD_PORT...\n\n" >> $SUMMARY_PATH
#
adb -s emulator-$AVD_PORT wait-for-device

# Sleep for 30 seconds.
printf "Sleeping for 30 seconds...\n\n"
printf "Sleeping for 30 seconds...\n\n" >> $SUMMARY_PATH
#
sleep 30

# Unlock the device.
printf "Unlocking device...\n\n"
printf "Unlocking device...\n\n" >> $SUMMARY_PATH
#
adb -s emulator-$AVD_PORT shell input keyevent 82

# Later we collect the logs from test run.
printf "Monitoring logs...\n\n"
printf "Monitoring logs...\n\n" >> $SUMMARY_PATH
LOGCAT_PATH="$OUTPUT_FOLDER/$LOGCAT_FILE"
#
adb -s emulator-$AVD_PORT logcat -d >> $LOGCAT_PATH

# Run tests against the emulator.
printf "Running tests, with gradle command:\nconnectedDevelopDebugAndroidTest\n\n"
printf "Running tests, with gradle command:\nconnectedDevelopDebugAndroidTest\n\n" >> $SUMMARY_PATH
RUN_TESTS_START=$(($(date +%s%N)/1000000))
#
./gradlew connectedDevelopDebugAndroidTest \
  -PdisablePreDex \
  -Pandroid.threadPoolSize=1 \
  -Dorg.gradle.parallel=false \
  -Dorg.gradle.jvmargs="$JVM_ARGS" \
  -Dorg.gradle.daemon=false \
  --info --stacktrace >> $OUTPUT_FOLDER/$RUN_TESTS_OP
#
RUN_TESTS_END=$(($(date +%s%N)/1000000))
RUN_TESTS_MS=$((RUN_TESTS_END-RUN_TESTS_START))
RUN_TESTS_S=$((RUN_TESTS_MS/1000))
RUN_TESTS_M_S=$((RUN_TESTS_S/60))
printf "Ran tests in:\n$RUN_TESTS_MS (ms)\n$RUN_TESTS_S (sec)\n$RUN_TESTS_M_S (min)\n\n"
printf "Ran tests in:\n$RUN_TESTS_MS (ms)\n$RUN_TESTS_S (sec)\n$RUN_TESTS_M_S (min)\n\n" >> $SUMMARY_PATH

# Copy results to output folder.
printf "Copying results to output folder...\n\n"
printf "Copying results to output folder...\n\n" >> $SUMMARY_PATH
# Copy the build outputs to artifacts.
cp -r ./app/build/outputs $OUTPUT_FOLDER
# Copy the test results to the test results directory.
cp -r ./app/build/outputs/androidTest-results/* $OUTPUT_FOLDER
# Copy the build reports to artifacts.
cp -r ./app/build/reports $OUTPUT_FOLDER
# Collect logs from emulator.
adb -s emulator-$AVD_PORT logcat -d >> $LOGCAT_PATH

# Kill the emulator.
printf "Killing AVD $AVD_NAME on port $AVD_PORT...\n\n"
printf "Killing AVD $AVD_NAME on port $AVD_PORT...\n\n" >> $SUMMARY_PATH
#
adb -s emulator-$AVD_PORT emu kill &

# Tell the user we finished.
FINISH_MILLIS=$(($(date +%s%N)/1000000))
TIME_TAKEN_MS=$((FINISH_MILLIS-CURRENT_MILLIS))
TIME_TAKEN_S=$((TIME_TAKEN_MS/1000))
TIME_TAKEN_MINS=$((TIME_TAKEN_S/60))
printf "Finish time (millis):\n$FINISH_MILLIS\n\n"
printf "Finish time (millis):\n$FINISH_MILLIS\n\n" >> $SUMMARY_PATH
printf "Total time taken:\n$TIME_TAKEN_MS (ms)\n$TIME_TAKEN_S (sec)\n$TIME_TAKEN_MINS (min)\n\n"
printf "Total time taken:\n$TIME_TAKEN_MS (ms)\n$TIME_TAKEN_S (sec)\n$TIME_TAKEN_MINS (min)\n\n" >> $SUMMARY_PATH
