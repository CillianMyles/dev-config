# bring a Mac up to date; safe to run over SSH

# macOS: list updates; installing needs the user's password and a restart,
# after which FileVault waits for an unlock at the console or KVM
softwareupdate --list
# sudo softwareupdate --install --all --restart

# Homebrew formulae and casks, including apps that update themselves; an app
# that was running keeps its old copy until relaunched, and the new one asks
# "downloaded from the internet?" at its first launch, on the Mac's screen
brew update && brew upgrade && brew upgrade --cask --greedy

# App Store apps, including Xcode
mas upgrade

# coding agents and toolchains that update outside Homebrew
claude update
grok update
command -v rustup >/dev/null && rustup update
