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
config.inactive_pane_hsb = {
  saturation = 0.7,
  brightness = 0.6,
}
config.enable_kitty_keyboard = true

local act = wezterm.action

-- Project launcher: opens a 2-pane layout (nvim left, claude right)
wezterm.on('trigger-project-launcher', function(window, pane)
  window:perform_action(
    act.PromptInputLine {
      description = 'Enter project directory path:',
      action = wezterm.action_callback(function(window, pane, line)
        if line and line ~= '' then
          local dir = line
          -- Spawn the initial pane (left side with nvim)
          local tab, left, win = window:mux_window():spawn_tab {
            cwd = dir,
          }
          -- Split right for claude (1/3 width)
          local right = left:split {
            direction = 'Right',
            size = 0.33,
            cwd = dir,
          }
          -- Send commands to each pane
          left:send_text('nvim .\n')
          right:send_text('claude\n')
        end
      end),
    },
    pane
  )
end)

config.keys = {
  -- paste from the clipboard
  { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
  -- paste from the primary selection
  { key = 'v', mods = 'CTRL', action = act.PasteFrom 'PrimarySelection' },
  -- Project launcher (nvim + terminal + claude)
  { key = 'o', mods = 'CTRL|SHIFT', action = act.EmitEvent 'trigger-project-launcher' },
}

return config
