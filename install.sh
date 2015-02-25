#!/bin/sh

##
# Install our tmux.conf file within our home directory.
#
# Edit this script as you like, or install the file manually.
#
# The install does two things:
#
#   * Copy the file `tmux.conf` to your home configuration
#     directory for tmux, which is typically `~/.config/tmux`
#
#   * Link the default tmux location `~/.tmux.conf` to this file.
#
#
##

dir="${XDG_CONFIG_HOME:-$HOME/.config}/tmux" &&
mkdir -p "$dir" &&
cp -R "tmux.conf" "$dir/" &&
ln -sfn "$HOME/.tmux.conf" "$dir/tmux.conf"
