# list Android emulators
emulator -list-avds

# start emulator called Pixel_6
emulator -avd Pixel_6

# type text 'blah'
adb shell input text 'blah'

# list signing configs for app/vairants
./gradlew signingReport
