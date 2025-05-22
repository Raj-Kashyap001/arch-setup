#!/bin/bash

WAYBAR_COLORS="$HOME/.config/waybar"
COLORS_CSS="$WAYBAR_COLORS/colors.css"
DARK_THEME="@define-color foreground #e8eaed;\n@define-color foreground-inactive #9aa0a6;\n@define-color background transparent;\n@define-color module-background #292a2d;\n@define-color accent #8ab4f8;\n@define-color hover-background #35363a;\n@define-color active-background #3c4043;"
LIGHT_THEME="@define-color foreground #202124;\n@define-color foreground-inactive #5f6368;\n@define-color background transparent;\n@define-color module-background #e8eaed;\n@define-color accent #1967d2;\n@define-color hover-background #dadce0;\n@define-color active-background #c9ccd1;"

# Check if the current theme is dark by looking for a dark theme color
if grep -q "#292a2d" "$COLORS_CSS"; then
    # Switch to light theme
    echo -e "$LIGHT_THEME" > "$COLORS_CSS"
    echo "Switched to light theme"
else
    # Switch to dark theme
    echo -e "$DARK_THEME" > "$COLORS_CSS"
    echo "Switched to dark theme"
fi

# Restart waybar to apply changes
killall waybar
waybar &>/dev/null &
