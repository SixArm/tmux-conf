#!/bin/sh
#
# Install our tmux conf files.
#
# Edit this script as you like, or install the files manually.
#
# This script does three things:
#
#   1. Create a tmux directory, typically `~/.config/tmux/`.
#
#   2. Copy these files `tmux*.conf` into the directory.
#
#   3. Link the default tmux location `~/.tmux.conf`.
#
# ## Tracking
#
# Program: install.sh
# Version: 4.0.0
# Created: 2014-11-29
# Updated: 2017-02-10
# Contact: Joel Parker Henderson (joel@joelparkerhenderson.com)
# License: GPL
##
set -euf

dir="${XDG_CONFIG_HOME:-$HOME/.config}/tmux"
mkdir -p "$dir"
cp tmux.conf tmux-status.conf tmux-mouse.conf tmux-linux.conf tmux-osx.conf "$dir/"
ln -sfn "$dir/tmux.conf" "$HOME/.tmux.conf"
