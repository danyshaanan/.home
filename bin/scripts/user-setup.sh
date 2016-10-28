#!/usr/bin/env bash

echo "Disabling OSX's log of everything you download..."
ln -fs /dev/null ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV2
