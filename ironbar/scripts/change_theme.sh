#!/usr/bin/env fish

function toggle_gtk_theme
    # Get the current GTK_THEME value
    set current_theme $GTK_THEME

    # Check if GTK_THEME is set
    if test -z "$current_theme"
        # If not set, default to Arc
        set current_theme "Arc"
    end

    # Split the theme name and mode (if present)
    set theme_parts (string split ':' $current_theme)
    set theme_name $theme_parts[1]
    set theme_mode $theme_parts[2]

    # Toggle the theme mode
    if test "$theme_mode" = "dark"
        set new_mode "light"
    else
        set new_mode "dark"
    end

    # Set the new theme
	set --erase --global GTK_THEME
    set new_theme "$theme_name:$new_mode"
	set --erase --global GTK_THEME
    set -Ux GTK_THEME $new_theme

    echo "GTK theme changed to $new_theme"
    echo "Please restart your applications or log out and log back in for the changes to take effect."
end

# Run the function
toggle_gtk_theme
