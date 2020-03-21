# tmux-conf

These are our tmux configuration files with annoations. We welcome feedback and pull requests.

* You can read the files to learn what they do, and we annotate the files to help explain.

* You can copy/paste any items that you like, from these files to your own `tmux.conf` file.

* You can source these files in your own `tmux.conf` file.


## How to source these files

You can edit your own `.tmux.conf` file, which is typically at `~/.tmux.conf`, and add lines such as these that set the tmux version and tmux platform:

```tmux
source $HOME/tmux-conf/sources/version.conf
source $HOME/tmux-conf/sources/version-specific/3.0/tmux.conf
source $HOME/tmux-conf/sources/platform.conf
source $HOME/tmux-conf/sources/platform-specific/darwin/tmux.conf
```

Then you can add any of these lines that you like:

```tmux
source $HOME/tmux-conf/sources/base-index-pane-number-is-1.conf
source $HOME/tmux-conf/sources/mouse.conf
source $HOME/tmux-conf/sources/prefix-is-control-a.conf
source $HOME/tmux-conf/sources/select-window-via-meta-number
source $HOME/tmux-conf/sources/select-layout-via-brackets
source $HOME/tmux-conf/sources/select-pane-via-hjkl.conf
source $HOME/tmux-conf/sources/shell.conf
source $HOME/tmux-conf/sources/split-window.conf
source $HOME/tmux-conf/sources/status-color-is-black-on-white.conf
source $HOME/tmux-conf/sources/status-via-powerline.conf
source $HOME/tmux-conf/sources/switch-session-via-name.conf
source $HOME/tmux-conf/sources/unbind-all-keys.conf
source $HOME/tmux-conf/sources/zoom-via-plus-minus.conf
```

If you do add `unbind-all-keys`, then add it first, because it clears many settings.


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

## Suppress warnings

If you want, you can use `set -q` to suppress warnings from nonexistent options. This which has been supported since tmux 1.7.

For example the option `mouse-utf8` exists in tmux 2.0 but does not exist in tmux 3.0, so you can set the optiona and suppress warnings like this:

```tmux
set -q mouse-utf8 on
```

## Primer

A good tmux primer:

* http://tangosource.com/blog/a-tmux-crash-course-tips-and-tweaks/


## Notation

Keys:

* C-x means press the control key and x key

* M-x means press the alt key and x key

What is a session, a window, a pane?

* A session is a set of windows.

* A window is a single screen covered with panes.

* A pane is a part of a window that runs a specific command, e.g. a shell.


## Use SSH to help with window naming

If you want to use SSH and have each new SSH window cause its own window naming,
then add this to your tmux config file, typically `~/.tmux.conf`:

```tmux
set-option -g allow-rename on
```

And add code like this to your SSH config file, typically `~/.ssh/config`:

```ssh
Host *
PermitLocalCommand yes
LocalCommand if [[ $TERM == screen* ]]; then printf "\033k%h\033\\"; fi
```

When we sign in to a server, The code runs a command to print the server's
local hostname with an escape sequence that triggers tmux to set the window title.
If we open the list of windows (ctrl-a w) we see each window's server name.
This is also the reason why I have automatic window renaming turned off.

Note: The allow-rename option was added in tmux 1.6 and with default on. The allow-rename default changed after tmux 2.7 from on to off. If allow-rename is off, then the SSH code to rename each window will not have any effect 

Credits:

  * http://www.unwiredcouch.com/2013/11/15/my-tmux-setup.html

  * https://www.reddit.com/user/moobarmoobar/


## See also

* http://blog.hawkhost.com/2010/07/02/tmux-%E2%80%93-the-terminal-multiplexer-part-2/

* https://wiki.archlinux.org/index.php/Tmux


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


## Key bindings

The command key bindings also with our preferred bindings in brackets.

```txt
C-b         Send the prefix key through to the application. [we prefer C-a]
C-o         Rotate the panes in the current window forwards.
C-z         Suspend the tmux client.
!           Break the current pane out of the window.
"           Split the current pane into two, top and bottom.
#           List all paste buffers.
$           Rename the current session.
| [%]       Split the current pane into two, left and right.
_           Split the current pane into two, top and bottom.
&           Kill the current window.
'           Prompt for a window index to select.
,           Rename the current window.
n/a [-]     Delete the most recently copied buffer of text.
.           Prompt for an index to move the current window.
0 to 9      Select windows 0 to 9.
; [:]       Enter the tmux command prompt.
n/a [;]     Move to the previously active pane.
=           Choose which buffer to paste interactively from a list.
+           Change a pane to a window. [custom]
-           Change a window to a pane. [custom]
?           List all key bindings.
D           Choose a client to detach.
[           Enter copy mode to copy text or view the history.
]           Paste the most recently copied buffer of text.
c           Create a new window.
d           Detach the current client.
f           Prompt to search for text in open windows.
i           Display some information about the current window.
l           Move to the previously selected window.
n           Change to the next window.
o           Select the next pane in the current window.
p           Change to the previous window.
q           Briefly display pane indexes.
r           Force redraw of the attached client.
s           Select a new session for the attached client interactively.
L           Switch the attached client back to the last session.
t           Show the time.
w           Choose the current window interactively.
x           Kill the current pane.
{           Swap the current pane with the previous pane.
}           Swap the current pane with the next pane.
~           Show previous messages from tmux, if any.
Page Up     Enter copy mode and scroll one page up.
↑ ↓ ← →     Change to the pane up, down, left, right of the current pane.
M-1 to M-5  Arrange panes in one of the five preset layouts: even-
              horizontal, even-vertical, main-horizontal, main-
              vertical, or tiled.
M-n         Move to the next window with a bell or activity marker.
M-o         Rotate the panes in the current window backwards.
M-p         Move to the previous window with a bell or activity
              marker.
C-↑ C-↓
C-←, C-→
            Resize the current pane in steps of one cell.
M-↑, M-↓
M-←, M-→
            Resize the current pane in steps of five cells.
```


## Tracking

* Package: sixarm.com/tmux-conf
* Version: 5.1.0
* Created: 2014-11-29
* Updated: 2020-03-20
* Contact: Joel Parker Henderson (joel@joelparkerhenderson.com)
* License: GPL
