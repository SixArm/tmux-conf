# SixArm.com » tmux » dot files

To install:

* Copy this file to your user configuration directory
* Lnk the default tmux location to this file:

```
dir="${XDG_CONFIG_HOME:-$HOME/.config}/tmux" &&
mkdir -p "$dir" &&
cp -R "tmux.conf" "$dir/" &&
ln -sfn "$HOME/.tmux.conf" "$dir/tmux.conf"
```
