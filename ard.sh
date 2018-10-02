#!/bin/bash

# Turn WiFi off
networksetup -setairportpower en1 off

# Login as ---
osascript -e 'tell application "SecurityAgent" to activate'; \
osascript -e 'tell application "Bluetooth Setup Assistant" to quit'; \
osascript <<EOF
tell application "System Events"
keystroke "USERNAME"
keystroke tab
delay 0.5
keystroke "PASSWORD"
delay 0.5
keystroke return
end tell
EOF

# Reset Dock and Launchpad
defaults delete com.apple.dock
defaults write com.apple.dock ResetLaunchPad -bool true
killall Dock

# Set Desktop picture
osascript -e 'tell application "System Events" to tell every desktop to set picture to "FILE_PATH"'

# Close app windows
osascript -e 'tell application "APP" to close every window'

# Chrome Fullscreen
osascript -e 'tell application "Google Chrome" to activate'
osascript <<EOF
tell application "System Events"
keystroke "f" using {control down, command down}
end tell
EOF

# Cleanup Desktop, Downloads
rm -rf ~/Desktop/* ~/Downloads/*

# Update Google Chrome
osascript -e 'tell application "Google Chrome" to open location "chrome://settings/help/"'

# Hit return
osascript <<EOF
tell application "System Events"
keystroke return
end tell
EOF

# Microsoft Update
open -a "Microsoft AutoUpdate"
osascript <<EOF
tell application "System Events"
delay 0.5
keystroke return
end tell
EOF

# cmd + Q
osascript -e 'tell application "System Events" to keystroke "q" using command down'

# Java Control Panel
open /Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin/ControlPanel

# Make Chrome default browser
open -a "Google Chrome" --args --make-default-browser

# List printers
lpstat -p

# Add printer
lpadmin -p "_IP_ADD_RE_SS" -v lpd://IP.ADD.RE.SS -P "/Library/Printers/PPDs/Contents/Resources/DRIVER.gz" -E -D "Printer Name"

# Close Google Chrome
osascript -e 'tell application "Google Chrome" to close every window'
open -a "Google Chrome"
osascript -e 'tell application "System Events" to keystroke "q" using command down'

# Disable user login
chpass -s /usr/bin/false USERNAME
