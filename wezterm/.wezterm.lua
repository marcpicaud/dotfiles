local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Maximize initial window size
-- see https://github.com/wezterm/wezterm/issues/284 
wezterm.on("gui-startup", function()
  local mux = wezterm.mux
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)


if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  -- We are running on Windows 

  -- Launch in WSL 
  config.default_domain = 'WSL:Ubuntu'
end

config.font = wezterm.font 'JetBrains Mono'
config.font_size = 14
config.color_scheme = 'Catppuccin Frappe'
config.enable_kitty_keyboard = true

local act = wezterm.action
config.keys = {
  -- paste from the clipboard
  { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
  -- paste from the primary selection
  { key = 'v', mods = 'CTRL', action = act.PasteFrom 'PrimarySelection' },
}

return config
