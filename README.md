# SixArm.com » tmux » dot files

These are our `tmux.conf` dot files.

You can read the files to see what they do. You can edit these as you like.

Note: we change the tmux prefix key from "C-b" to "C-a" because it's easier to type and to match the command `screen`.

To use these files, one way is to source them in your own tmux configuration file.

For example edit `~/.tmux.conf` and add these lines for tmux version 3.0 on the macOS platform a.k.a. Darwin:

```tmux
source $HOME/sixarm_tmux_dotfiles/tmux/tmux.conf
source $HOME/sixarm_tmux_dotfiles/tmux/version-specific/3.0/tmux.conf
source $HOME/sixarm_tmux_dotfiles/tmux/platform-specific/darwin/tmux.conf
```

A good tmux primer:

* http://tangosource.com/blog/a-tmux-crash-course-tips-and-tweaks/


## Version-specific settings

See the  directory `version-specific`.

We use version-specific files to help us run tmux on many systems,
including systems where we can't easily upgrade tmux ourselves.

For example, when we use version 3.0 then we want to set the mouse like this:

```tmux
set -g mouse on
```

## Platform-specific settings

See the directory. `platform-specific`.

We use platform-specific files to help us run tmux on many systems.

For example, when we use the macOS platform a.k.a. Darwin,
then we want this setting:

```tmux
# After copying to a tmux buffer, hit y again to copy to clipboard.
bind y run "tmux save-buffer - | reattach-to-user-namespace pbcopy"
```

## Thanks

Thanks to many people on the net for providing tmux conf files,
and blogging about how to set tmux and its related tools.

* https://gist.github.com/andreyvit/2921703
* https://github.com/terryma/dotfiles/blob/master/.tmux.conf
* http://www.mindfuzz.net/?p=178
* http://tangledhelix.com/blog/2012/07/16/tmux-and-mouse-mode/
* http://www.unwiredcouch.com/2013/11/15/my-tmux-setup.html
* http://stackoverflow.com/questions/35016458
* http://stackoverflow.com/users/5353461/tom-hale
* https://github.com/HaleTom

## Tracking

* Package: sixarm_tmux_dotfiles
* Version: 5.0.0
* Created: 2014-11-29
* Updated: 2020-03-19
* Contact: Joel Parker Henderson (joel@joelparkerhenderson.com)
* License: GPL
