#!/bin/bash

# Git

alias gst='git status '
alias gd='git diff '
alias ga='git add '
alias gaa='git add --all '
alias gc='git commit --verbose '
alias gcm='git commit --message '
alias gcam='git commit --all --message '
alias gb='git branch '
alias gcl='git clone --recurse-submodules '
alias gco='git checkout '
alias gcb='git checkout -b '
alias gpull='git pull '
alias gpush='git push '
alias ggf='git push --force '
alias ggfl='git push --force-with-lease '
alias grh='git reset '
alias grhh='git reset --hard '
alias gl='git log '
alias gcp='git cherry-pick '
alias grv='git revert '
alias gstash='git stash push -m '
alias gspop='git stash pop '

# Flutter

alias fv='flutter --version'
alias fwv='./flutterw --version'

alias fd='flutter doctor'
alias fwd='./flutterw doctor'

alias fpg='flutter pub get'
alias fwpg='./flutterw pub get'

alias fcl='flutter clean'
alias fwcl='./flutterw clean'

alias fmbs='flutter pub run melos bs'
alias fwmbs='.flutter/bin/dart pub run melos bs'

alias fcg='flutter pub run build_runner build --delete-conflicting-outputs'
alias fwcg='.flutter/bin/dart pub run build_runner build --delete-conflicting-outputs'

alias fmcg='flutter pub run melos codegen'
alias fwmcg='.flutter/bin/dart pub run melos codegen'
