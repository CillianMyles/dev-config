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

# commonly used -> create aliases (?)
flutter analyze
flutter test
flutter test --coverage
flutter format .
flutter format -n --set-exit-if-changed .

# publishing
flutter packages pub publish --dry-run
flutter packages pub publish
flutter pub global run dartdoc:dartdoc
pub global activate dartdoc
dartdoc

# git submodules
git submodule update --init
git submodule foreach git reset --hard

# code gen -> freezed, json serializable
flutter packages pub run build_runner build
flutter packages pub run build_runner build --delete-conflicting-outputs
flutter packages pub run build_runner watch
flutter packages pub run build_runner watch --delete-conflicting-outputs

# melos
flutter pub global activate melos
flutter pub global run melos bootstrap
flutter pub global run melos analyze
flutter pub global run melos test

# nativeshell/cargo/rust updates
eval `ssh-agent -s`
ssh-add
cargo build

# redux dev tools
remotedev --port 8000 # -> http://localhost:8000
