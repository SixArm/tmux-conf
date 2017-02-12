# SixArm.com » tmux » dot files

These are our `tmux.conf` dot files.

You can read the files to see what they do. You can edit your own copy as you like.

Two important items for a beginner to know:

  * We change the tmux prefix key from "C-b" to "C-a".

  * We change the installation location from `~/.tmux.conf` to `~/.config/tmux/tmux.conf`. This is because we generally like to use the XDG Base Directories Specification, which recommends using the default config directory `~/.config`.


To install:

```
./install.sh
```

A good tmux primer:

* http://tangosource.com/blog/a-tmux-crash-course-tips-and-tweaks/


## Version-specific settings

See the `version-specific` directory.

We use version-specific files to help us run tmux on many systems,
including systems where we can't easily upgrade tmux ourselves.

For example, when we use version 2.0 then we want to set UTF8 like this:

    set -g utf8 on
    set -g status-utf8 on
    set -g mouse-utf8 on


## Platform-specific settings

See the `platform-specific` directory.

We use platform-specific files to help us run tmux on many systems.

For example, when we use the macOS platform a.k.a. Darwin,
then we want this setting:

    # After copying to a tmux buffer, hit y again to copy to clipboard.
    bind y run "tmux save-buffer - | reattach-to-user-namespace pbcopy"


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

## Tracking

* Package: sixarm_tmux_dotfiles
* Version: 4.0.0
* Created: 2014-11-29
* Updated: 2017-02-10
* Contact: Joel Parker Henderson (joel@joelparkerhenderson.com)
* License: GPL
