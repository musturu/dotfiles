local wezterm = require 'wezterm'

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Color scheme

-- Font configuration
config.font = wezterm.font('JetBrains Mono')
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
  },
  -- Make username/project paths clickable. This implies paths like the following are clickable:
  --  jonathanschimpf/wezterm
  {
    regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
    format = "https://github.com/$1/$3",
  },
}

return config-- Pull in the wezterm API
