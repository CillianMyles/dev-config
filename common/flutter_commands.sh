# commonly used -> create aliases (?)
flutter analyze
flutter test
flutter test --coverage
flutter format .
flutter format -n --set-exit-if-changed .
flutter packages pub publish --dry-run
flutter packages pub publish

# code gen -> freezed
flutter packages pub run build_runner build
flutter packages pub run build_runner watch
flutter packages pub run build_runner build --delete-conflicting-outputs
flutter packages pub run build_runner watch --delete-conflicting-outputs

# debug tools
remotedev --port 8000 # -> http://localhost:8000

# check install state
flutter doctor -v

# check flutter version
flutter --version

# get some help
flutter help

# list subcommands
flutter <command> -h

# build all variants
flutter build

# build for macOS
flutter build macos

# run on attached device
flutter run

# run on macOS
flutter run -d macos
