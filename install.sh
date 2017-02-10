#!/bin/sh
#
# Install our tmux conf files.
#
# Edit this script as you like, or install the files manually.
#
# This script does three things:
#
#   1. Pick a tmux directory, typically `~/.config/tmux`.
#
#   2. If the directory already exists, move it to a backup.
#
#   3. Copy this repo's files into the directory.
#
#   4. Link the default tmux location `~/.tmux.conf`.
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

## Conventions
out() { printf %s\\n "$*" ; }
sec() { date -u "+%s" ; }
confdir() { echo ${XDG_CONFIG_HOME:-$HOME/.config}; }

## Main
dir="$(confdir)/tmux"
out "dir:$dir"
[ -e "$dir" ] && mv "$dir" "$dir-backup-$(sec)"
mkdir -p "$dir"
cp -R tmux "$dir"
ln -sfn "$dir/tmux.conf" "$HOME/.tmux.conf"
