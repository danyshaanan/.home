#!/usr/bin/env bash

echo "Disabling OSX's log of everything you download..."
ln -fs /dev/null ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV2

echo "Disabling Java's auto-update notifications..."
sudo defaults write /LibraryPreferences/com.oracle.java.Java-Updater JavaAutoUpdateEnabled -bool false
