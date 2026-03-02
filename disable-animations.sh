#!/bin/bash
#
# disable-animations.sh
# Disables all macOS UI animations for a snappier experience.
# Run with: bash disable-animations.sh
# Undo with: bash restore-animations.sh
#

set -e

echo "Disabling macOS animations..."

###############################################################################
# Global / NSGlobalDomain                                                     #
###############################################################################

# Disable the open/close window and popover animations
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

# Disable smooth (animated) scrolling in scroll views
defaults write -g NSScrollAnimationEnabled -bool false

# Speed up window resize animations to near-instant (0 breaks things; 0.001 is safe minimum)
defaults write -g NSWindowResizeTime -float 0.001

# Remove the fade-in/fade-out animation on Quick Look panels
defaults write -g QLPanelAnimationDuration -float 0

# Disable rubber-band overscroll bounce in native scroll views (does not affect web views)
defaults write -g NSScrollViewRubberbanding -bool false

# Disable the zoom transition when entering/exiting the Versions browser
defaults write -g NSDocumentRevisionsWindowTransformAnimation -bool false

# Remove the slide animation for the toolbar and menu bar in full-screen mode
defaults write -g NSToolbarFullScreenAnimationDuration -float 0

# Disable the smooth-scroll animation in Finder column views
defaults write -g NSBrowserColumnAnimationSpeedMultiplier -float 0

###############################################################################
# Dock                                                                        #
###############################################################################

# Make the Dock appear and disappear instantly when auto-hide is enabled
defaults write com.apple.dock autohide-time-modifier -float 0

# Remove the delay before the Dock starts to show/hide
defaults write com.apple.dock autohide-delay -float 0

# Disable the fly-in animation for Mission Control (Ctrl+Up / swipe up)
defaults write com.apple.dock expose-animation-duration -float 0

# Disable the zoom animation when opening Launchpad
defaults write com.apple.dock springboard-show-duration -float 0

# Disable the zoom animation when closing Launchpad
defaults write com.apple.dock springboard-hide-duration -float 0

# Disable the slide animation when switching Launchpad pages
defaults write com.apple.dock springboard-page-duration -float 0

###############################################################################
# Finder                                                                      #
###############################################################################

# Master toggle: disable every animation inside Finder (window transitions, etc.)
defaults write com.apple.finder DisableAllAnimations -bool true

###############################################################################
# Mail                                                                        #
###############################################################################

# Disable the swoosh animation when sending a message
# defaults write com.apple.Mail DisableSendAnimations -bool true

# Disable the slide-in animation when opening a reply/compose window
# defaults write com.apple.Mail DisableReplyAnimations -bool true

###############################################################################
# Accessibility                                                               #
###############################################################################

# Enable system-wide "Reduce Motion" (affects full-screen transitions, etc.)
# defaults write com.apple.universalaccess reduceMotion -bool true

###############################################################################
# Restart affected processes to apply changes immediately                     #
###############################################################################

killall Dock     2>/dev/null || true
killall Finder   2>/dev/null || true
killall Mail     2>/dev/null || true

echo "Done. All animations have been disabled."
echo "Log out and back in (or reboot) if some changes do not take effect immediately."
