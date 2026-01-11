# Wezterm

These are my Wezterm settings for a Windows PC where I exclusively use WSL2 with Ubuntu.

## Setup

This dotfiles repo lives inside WSL. To make Wezterm (running on Windows) pick up the config, the `.wezterm.lua` file needs to be symlinked to the Windows filesystem.

The symlink must be created from the Windows side using `mklink`:

```powershell
cmd /c mklink C:\Users\{USERNAME}\.wezterm.lua \\wsl$\Ubuntu\path\to\dotfiles\wezterm\.wezterm.lua
```

Replace `{USERNAME}` with your Windows username and adjust the path to where you cloned this repo in WSL.
