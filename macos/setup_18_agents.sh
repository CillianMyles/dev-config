# coding agents and the tooling every fleet box needs (see the box-setup skill
# in CillianMyles/skills)

# remote access: Tailscale's standalone app and T3 Code (both update themselves)
brew install --cask tailscale-app
brew install --cask t3-code

# CLIs agents and the fleet skills use; mas updates App Store apps (Xcode)
brew install gh jq tmux mas

# Claude Code: official installer (checks its binary), links ~/.local/bin/claude
curl -fsSL https://claude.ai/install.sh | bash

# Codex
brew install --cask codex

# Grok: the installer checks no checksums, so read it, then pin a version
curl -fsSL https://x.ai/cli/install.sh -o /tmp/grok-install.sh
# bash /tmp/grok-install.sh <version>
