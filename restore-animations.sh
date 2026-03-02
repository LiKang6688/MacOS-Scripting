#!/bin/bash
#
# restore-animations.sh
# Reverts all animation-related defaults changed by disable-animations.sh
# back to macOS system defaults.
# Run with: bash restore-animations.sh
#

set -e

echo "Restoring macOS animations to system defaults..."

###############################################################################
# Global / NSGlobalDomain                                                     #
###############################################################################

# Re-enable open/close window and popover animations
defaults delete -g NSAutomaticWindowAnimationsEnabled 2>/dev/null || true

# Re-enable smooth scrolling
defaults delete -g NSScrollAnimationEnabled 2>/dev/null || true

# Restore default window resize speed
defaults delete -g NSWindowResizeTime 2>/dev/null || true

# Restore Quick Look panel fade animation
defaults delete -g QLPanelAnimationDuration 2>/dev/null || true

# Re-enable rubber-band overscroll bounce
defaults delete -g NSScrollViewRubberbanding 2>/dev/null || true

# Restore Versions browser zoom transition
defaults delete -g NSDocumentRevisionsWindowTransformAnimation 2>/dev/null || true

# Restore full-screen toolbar/menu bar slide animation
defaults delete -g NSToolbarFullScreenAnimationDuration 2>/dev/null || true

# Restore Finder column view smooth-scroll animation
defaults delete -g NSBrowserColumnAnimationSpeedMultiplier 2>/dev/null || true

###############################################################################
# Dock                                                                        #
###############################################################################

# Restore Dock auto-hide animation speed
defaults delete com.apple.dock autohide-time-modifier 2>/dev/null || true

# Restore Dock auto-hide delay
defaults delete com.apple.dock autohide-delay 2>/dev/null || true

# Restore Mission Control fly-in animation
defaults delete com.apple.dock expose-animation-duration 2>/dev/null || true

# Restore Launchpad open animation
defaults delete com.apple.dock springboard-show-duration 2>/dev/null || true

# Restore Launchpad close animation
defaults delete com.apple.dock springboard-hide-duration 2>/dev/null || true

# Restore Launchpad page-switch animation
defaults delete com.apple.dock springboard-page-duration 2>/dev/null || true

###############################################################################
# Finder                                                                      #
###############################################################################

# Re-enable all Finder animations
defaults delete com.apple.finder DisableAllAnimations 2>/dev/null || true

###############################################################################
# Mail                                                                        #
###############################################################################

# Re-enable send animation
defaults delete com.apple.Mail DisableSendAnimations 2>/dev/null || true

# Re-enable reply/compose animation
defaults delete com.apple.Mail DisableReplyAnimations 2>/dev/null || true

###############################################################################
# Accessibility                                                               #
###############################################################################

# Disable "Reduce Motion" (restore system animations)
defaults delete com.apple.universalaccess reduceMotion 2>/dev/null || true

###############################################################################
# Restart affected processes to apply changes immediately                     #
###############################################################################

killall Dock     2>/dev/null || true
killall Finder   2>/dev/null || true
killall Mail     2>/dev/null || true

echo "Done. All animations have been restored to macOS defaults."
echo "Log out and back in (or reboot) if some changes do not take effect immediately."
