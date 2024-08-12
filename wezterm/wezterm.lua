local wezterm = require 'wezterm'

local config = {}



-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.enable_wayland = true


-- Font configuration
config.font = wezterm.font('IBM Plex Mono')
config.font_size = 11.5

-- Window configuration
config.window_background_opacity = 0.95
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- Tab bar configuration
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- Key bindings
config.keys = {
  {
    key = 'n',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.SpawnWindow,
  },
  {
    key = 't',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  {
    key = 'w',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.CloseCurrentTab{confirm=true},
  },
}

-- Shell configuration
config.default_prog = {'fish', '-l'}

-- Cursor configuration
config.default_cursor_style = 'SteadyBlock'

-- Scrollback
config.scrollback_lines = 10000

-- Enable native IME (Input Method Editor)
config.use_ime = true

-- Enable WebGL for better performance
config.webgpu_preferred_adapter = wezterm.gui.enumerate_gpus()[1]

-- Set the default working directory
config.default_cwd = wezterm.home_dir

-- Enable ligatures
config.harfbuzz_features = {"calt", "clig", "liga"}

-- Configure hyperlink rules
config.hyperlink_rules = {
  -- Linkify URLs
  {
    regex = "\\b\\w+://(?:[\\w.-]+)\\.[a-z]{2,15}\\S*\\b",
    format = "$0",
  }
}
-- Function to get the GTK theme mode
local function get_gtk_theme_mode()
    local gtk_theme = os.getenv("GTK_THEME")

    if gtk_theme then
        -- Check if the theme contains ":dark" or ":light"
        if string.match(gtk_theme:lower(), ":dark") then
            return "dark"
        elseif string.match(gtk_theme:lower(), ":light") then
            return "light"
        else
            -- If no mode specified, assume it's based on the theme name
            if string.match(gtk_theme:lower(), "dark") then
                return "dark"
            elseif string.match(gtk_theme:lower(), "light") then
                return "light"
            end
        end
    end

    -- Default to dark if we couldn't determine the theme
    wezterm.log_info("Defaulting to dark theme")
    return "dark"
end

local function get_colorscheme()
    local mode = get_gtk_theme_mode()
    if string.match(mode, "dark") then
        return  "Catch Me If You Can (terminal.sexy)"-- Replace with your preferred dark theme
    else
        return "lightmust" -- Replace with your preferred light theme
    end
end

wezterm.log_info(get_colorscheme())
config.color_scheme = get_colorscheme()
wezterm.log_info(config.color_scheme)


config.color_schemes = {
  ['lightmust'] = {
    	background = '#eeeff5',
		foreground = '#000406',
		cursor_bg = '#6c56e8',
		selection_bg = '#faf743',
		scrollbar_thumb = '6c56e8'

  },
	['byp'] = {
		background = 'blue';
	}
}

return config-- Pull in the wezterm API
