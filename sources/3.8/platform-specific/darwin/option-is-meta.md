# Option as Meta on macOS

tmux bindings such as `M-1` (see `select-window-via-meta-number.conf`)
need the terminal to send the Option key as Meta (i.e. Escape-prefixed).
This is a terminal setting, not a tmux setting.

* iTerm2: Settings > Profiles > Keys > "Left Option key" > "Esc+".

* Terminal.app: Settings > Profiles > Keyboard > "Use Option as Meta key".

* Ghostty: `macos-option-as-alt = true`.

* WezTerm: `send_composed_key_when_left_alt_is_pressed = false`.
