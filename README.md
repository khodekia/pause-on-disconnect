# Pause on Disconnect

This repository contains a Lua script that configures `WirePlumber` to automatically pause music playback when headphones are disconnected.
## Features

- Detects when headphones are unplugged from the default audio sink.
- Automatically pauses playback using `playerctl`.

## Requirements

- `WirePlumber` (Session and Policy Manager for PipeWire)
- `playerctl` (Command-line utility to control media players)

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/khodekia/pause-on-disconnect.git
   cd pause-on-disconnect
   ```

2. Copy the script to your WirePlumber configuration directory:
   ```bash
   mkdir -p ~/.config/wireplumber
   cp pause-on-disconnect.lua ~/.config/wireplumber/
   ```

3. Enable the script in WirePlumber:
   Edit or create the file `~/.config/wireplumber/main.lua.d/50-user-config.lua` and add the following line:
   ```lua
   ["pause-on-disconnect.lua"] = true,
   ```

4. Restart WirePlumber to apply changes:
   ```bash
   systemctl --user restart wireplumber
   ```

## Usage

- Play music using any `MPRIS`-compatible media player (e.g., VLC, Spotify).
- Disconnect your headphones. Playback will automatically pause.

## Notes

- The script uses `playerctl` to control playback. Ensure `playerctl` is installed:
   ```bash
   sudo dnf install playerctl
   ```

- This behavior applies only to the default audio sink.

## License

This project is licensed under the MIT License.
