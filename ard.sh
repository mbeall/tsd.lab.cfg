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
open -a "Google Chrome"
osascript -e 'tell application "Google Chrome" to close every window'
osascript -e 'tell application "System Events" to keystroke "q" using command down'

# Disable user login
chpass -s /usr/bin/false USERNAME

# Add National Geographic screensaver photos as desktop background options (root)
cp -p "/Library/Screen Savers/Default Collections/1-National Geographic/NatGeo01.jpg" "/Library/Desktop Pictures/Emperor Penguins.jpg"
cp -p "/Library/Screen Savers/Default Collections/1-National Geographic/NatGeo02.jpg" "/Library/Desktop Pictures/Life at the Edge.jpg"
cp -p "/Library/Screen Savers/Default Collections/1-National Geographic/NatGeo03.jpg" "/Library/Desktop Pictures/Glaciers.jpg"
cp -p "/Library/Screen Savers/Default Collections/1-National Geographic/NatGeo04.jpg" "/Library/Desktop Pictures/Limestone Hills.jpg"
cp -p "/Library/Screen Savers/Default Collections/1-National Geographic/NatGeo05.jpg" "/Library/Desktop Pictures/Atacama Desert.jpg"
cp -p "/Library/Screen Savers/Default Collections/1-National Geographic/NatGeo06.jpg" "/Library/Desktop Pictures/Painting the Sky.jpg"
cp -p "/Library/Screen Savers/Default Collections/1-National Geographic/NatGeo07.jpg" "/Library/Desktop Pictures/Chinese Mystic Waters.jpg"
cp -p "/Library/Screen Savers/Default Collections/1-National Geographic/NatGeo08.jpg" "/Library/Desktop Pictures/Austfonna Ice Cap.jpg"
#cp -p "/Library/Screen Savers/Default Collections/1-National Geographic/NatGeo09.jpg" "/Library/Desktop Pictures/NAME?.jpg"
cp -p "/Library/Screen Savers/Default Collections/1-National Geographic/NatGeo10.jpg" "/Library/Desktop Pictures/Sea Animals.jpg"
cp -p "/Library/Screen Savers/Default Collections/1-National Geographic/NatGeo11.jpg" "/Library/Desktop Pictures/African Sunset.jpg"
#cp -p "/Library/Screen Savers/Default Collections/1-National Geographic/NatGeo12.jpg" "/Library/Desktop Pictures/NAME?.jpg"
cp -p "/Library/Screen Savers/Default Collections/1-National Geographic/NatGeo13.jpg" "/Library/Desktop Pictures/3 Degrees of Japanese Seas.jpg"
cp -p "/Library/Screen Savers/Default Collections/1-National Geographic/NatGeo14.jpg" "/Library/Desktop Pictures/African Super Park.jpg"
#cp -p "/Library/Screen Savers/Default Collections/1-National Geographic/NatGeo15.jpg" "/Library/Desktop Pictures/NAME?.jpg"
cp -p "/Library/Screen Savers/Default Collections/1-National Geographic/NatGeo16.jpg" "/Library/Desktop Pictures/South Sandwich Islands.jpg"
cp -p "/Library/Screen Savers/Default Collections/1-National Geographic/NatGeo17.jpg" "/Library/Desktop Pictures/Lion and Cub.jpg"

# Silent installation for Flash Player
# 1. Extract the Adobe Flash Player installer bundle (Install Adobe Flash Player.app) from the .DMG file.
# 2. Change to the directory where the .app file is saved.
sudo ./Install Adobe Flash Player.app/Contents/MacOS/Adobe Flash Player Install Manager -install
