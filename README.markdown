# SixArm.com » tmux » dot files

To install:

```
dir="${XDG_CONFIG_HOME:-$HOME/.config}/tmux" &&
mkdir -p "$dir" &&
cp -R "tmux.conf" "$dir/" &&
ln -sfn "$HOME/.tmux.conf" "$dir/tmux.conf"
```


The install will do two things:

  * Copy the file `tmux.conf` to your home configuration directory for tmux, typically `~/.config/tmux`
  * Link the default tmux location `~/.tmux.conf` to this file.
