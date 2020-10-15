# Based on https://github.com/henrik/dotfiles/blob/master/extras/os_x_defaults.sh

echo "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)."
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "Disable menu bar transparency."
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false

echo "Expand save panel by default."
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo "Disable the 'Are you sure you want to open this application?' dialog."
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "Disable window animations."
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# http://bengold.tv/post/21711266050
echo "Speed up dock show/hide animation."
defaults write com.apple.dock autohide-time-modifier -float 0.5
killall Dock

# http://osxdaily.com/2011/01/26/change-the-screenshot-save-file-location-in-mac-os-x/
echo "Change screenshot location."
mkdir -p ~/Screenshots
defaults write com.apple.screencapture location ~/Screenshots/
killall SystemUIServer

# TODO: broken on macOS Sierra: https://github.com/mathiasbynens/dotfiles/issues/687 Set it manually in UI for now.
echo "Set a blazingly fast keyboard repeat rate."
defaults write NSGlobalDomain KeyRepeat -int 1

echo "Disable Accent Keys"
defaults write -g ApplePressAndHoldEnabled -bool false

# TODO: broken on macOS Sierra: https://github.com/mathiasbynens/dotfiles/issues/687 Set it manually in UI for now.
echo "Set a shorter Delay until key repeat."
defaults write NSGlobalDomain InitialKeyRepeat -int 10

echo "Increase window resize speed for Cocoa applications."
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

echo "Show item info below desktop icons."
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

echo "Enable snap-to-grid for desktop icons."
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

echo "Disable disk image verification."
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

echo "Automatically open a new Finder window when a volume is mounted."
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true

echo "Display full POSIX path as Finder window title."
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

echo "Show Path bar in Finder."
defaults write com.apple.finder ShowPathbar -bool true

echo "Show Status bar in Finder."
defaults write com.apple.finder ShowStatusBar -bool true

echo "Use current directory as default search scope in Finder."
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo "Show the ~/Library folder."
chflags nohidden ~/Library

echo "Disable the Ping sidebar in iTunes."
defaults write com.apple.iTunes disablePingSidebar -bool true

echo "Disable all the other Ping stuff in iTunes."
defaults write com.apple.iTunes disablePing -bool true

echo "Changed defaults. Restarting apps…"

echo "Restart Finder."
killall Finder

echo "Please lock your account and log back in to make the keyboard repeat settings take on macOS Sierra."

echo "All done."